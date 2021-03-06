-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Union.SearchResultItem exposing (onIssue, onMarketplaceListing, onOrganization, onPullRequest, onRepository, onUser, selection)

import Github.InputObject
import Github.Interface
import Github.Object
import Github.Scalar
import Github.Union
import Graphql.Field as Field exposing (Field)
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (FragmentSelectionSet(..), SelectionSet(..))
import Json.Decode as Decode


selection : (Maybe typeSpecific -> constructor) -> List (FragmentSelectionSet typeSpecific Github.Union.SearchResultItem) -> SelectionSet constructor Github.Union.SearchResultItem
selection constructor typeSpecificDecoders =
    Object.unionSelection typeSpecificDecoders constructor


onIssue : SelectionSet decodesTo Github.Object.Issue -> FragmentSelectionSet decodesTo Github.Union.SearchResultItem
onIssue (SelectionSet fields decoder) =
    FragmentSelectionSet "Issue" fields decoder


onPullRequest : SelectionSet decodesTo Github.Object.PullRequest -> FragmentSelectionSet decodesTo Github.Union.SearchResultItem
onPullRequest (SelectionSet fields decoder) =
    FragmentSelectionSet "PullRequest" fields decoder


onRepository : SelectionSet decodesTo Github.Object.Repository -> FragmentSelectionSet decodesTo Github.Union.SearchResultItem
onRepository (SelectionSet fields decoder) =
    FragmentSelectionSet "Repository" fields decoder


onUser : SelectionSet decodesTo Github.Object.User -> FragmentSelectionSet decodesTo Github.Union.SearchResultItem
onUser (SelectionSet fields decoder) =
    FragmentSelectionSet "User" fields decoder


onOrganization : SelectionSet decodesTo Github.Object.Organization -> FragmentSelectionSet decodesTo Github.Union.SearchResultItem
onOrganization (SelectionSet fields decoder) =
    FragmentSelectionSet "Organization" fields decoder


onMarketplaceListing : SelectionSet decodesTo Github.Object.MarketplaceListing -> FragmentSelectionSet decodesTo Github.Union.SearchResultItem
onMarketplaceListing (SelectionSet fields decoder) =
    FragmentSelectionSet "MarketplaceListing" fields decoder
