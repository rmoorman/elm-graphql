module Graphqelm.Generator.Group exposing (IntrospectionData, generateFiles)

import Dict exposing (Dict)
import Graphqelm.Generator.Enum
import Graphqelm.Generator.Object
import Graphqelm.Generator.ObjectTypes as ObjectTypes
import Graphqelm.Generator.Query
import Graphqelm.Parser.Type as Type exposing (Field, TypeDefinition)


type alias IntrospectionData =
    { typeDefinitions : List TypeDefinition
    , queryObjectName : String
    }


generateFiles : IntrospectionData -> Dict String String
generateFiles { typeDefinitions, queryObjectName } =
    let
        objectTypes =
            ( [ "Api", "Object" ], ObjectTypes.generate typeDefinitions )
    in
    typeDefinitions
        |> List.filterMap (toPair queryObjectName)
        |> List.append [ objectTypes ]
        |> List.map (Tuple.mapFirst moduleToFileName)
        |> Dict.fromList


moduleToFileName : List String -> String
moduleToFileName modulePath =
    (modulePath |> String.join "/")
        ++ ".elm"


toPair : String -> TypeDefinition -> Maybe ( List String, String )
toPair queryObjectName ((Type.TypeDefinition name definableType) as definition) =
    if String.startsWith "__" name then
        Nothing
    else
        case definableType of
            Type.ObjectType fields ->
                if name == queryObjectName then
                    Graphqelm.Generator.Query.generate fields
                        |> Just
                else
                    Graphqelm.Generator.Object.generate name fields
                        |> Just

            Type.ScalarType ->
                Nothing

            Type.EnumType enumValues ->
                Graphqelm.Generator.Enum.generate name enumValues
                    |> Just

            Type.InterfaceType fields ->
                Graphqelm.Generator.Object.generate name fields
                    |> Just
