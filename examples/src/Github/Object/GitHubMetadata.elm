module Github.Object.GitHubMetadata exposing (..)

import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.GitHubMetadata
selection constructor =
    Object.object constructor


gitHubServicesSha : FieldDecoder String Github.Object.GitHubMetadata
gitHubServicesSha =
    Object.fieldDecoder "gitHubServicesSha" [] Decode.string


gitIpAddresses : FieldDecoder (List String) Github.Object.GitHubMetadata
gitIpAddresses =
    Object.fieldDecoder "gitIpAddresses" [] (Decode.string |> Decode.list)


hookIpAddresses : FieldDecoder (List String) Github.Object.GitHubMetadata
hookIpAddresses =
    Object.fieldDecoder "hookIpAddresses" [] (Decode.string |> Decode.list)


importerIpAddresses : FieldDecoder (List String) Github.Object.GitHubMetadata
importerIpAddresses =
    Object.fieldDecoder "importerIpAddresses" [] (Decode.string |> Decode.list)


isPasswordAuthenticationVerifiable : FieldDecoder Bool Github.Object.GitHubMetadata
isPasswordAuthenticationVerifiable =
    Object.fieldDecoder "isPasswordAuthenticationVerifiable" [] Decode.bool


pagesIpAddresses : FieldDecoder (List String) Github.Object.GitHubMetadata
pagesIpAddresses =
    Object.fieldDecoder "pagesIpAddresses" [] (Decode.string |> Decode.list)