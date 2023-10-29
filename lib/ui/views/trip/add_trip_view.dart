import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/model/place_model.dart';
import 'package:travel_kenya/ui/views/trip/add_trip_view.form.dart';
import 'package:travel_kenya/ui/widgets/input_decoration.dart';

import 'trip_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'name',
  ),
  FormTextField(
    name: 'place',
  ),
  FormTextField(
    name: 'startDate',
  ),
  FormTextField(
    name: 'endDate',
  ),
])
class AddTripView extends StackedView<TripViewModel> with $AddTripView {
  const AddTripView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TripViewModel viewModel,
    Widget? child,
  ) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    bool isPlaceSelected = viewModel.selectedPlace.image != "";

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        if (isPlaceSelected)
          Opacity(
            opacity: .35,
            child: CachedNetworkImage(
              height: size.height,
              width: size.width,
              fit: BoxFit.cover,
              imageUrl: viewModel.selectedPlace.image,
            ),
          ),
        Scaffold(
          backgroundColor: isPlaceSelected
              ? Colors.transparent
              : theme.colorScheme.background,
          appBar: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(
                color:
                    isPlaceSelected ? kcWhite : theme.colorScheme.onBackground),
            // backgroundColor: theme.colorScheme.background,
            backgroundColor: isPlaceSelected
                ? Colors.transparent
                : theme.colorScheme.background,

            title: ManropeText.medium("Add Trip", 18,
                isPlaceSelected ? kcWhite : theme.colorScheme.onBackground),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceMedium,
                  ManropeText.semiBold(
                      "Trip Name",
                      14,
                      isPlaceSelected
                          ? kcWhite
                          : theme.colorScheme.onBackground),
                  verticalSpaceSmall,
                  TextFormField(
                    controller: nameController,
                    focusNode: nameFocusNode,
                    decoration: inputDecorationOne(
                      hint: "Trip Name",
                      enabledColor:
                          isPlaceSelected ? kcWhite : theme.colorScheme.outline,
                      focusedColor:
                          isPlaceSelected ? kcWhite : theme.colorScheme.outline,
                      errorColor: theme.colorScheme.error,
                    ),
                  ),
                  verticalSpaceTiny,
                  verticalSpaceSmall,
                  ManropeText.semiBold(
                      "Location",
                      14,
                      isPlaceSelected
                          ? kcWhite
                          : theme.colorScheme.onBackground),
                  verticalSpaceSmall,
                  TypeAheadField<PlaceModel>(
                    textFieldConfiguration: TextFieldConfiguration(
                      autofocus: true,
                      style: manropeMedium.copyWith(),
                      decoration: inputDecorationOne(
                        hint: "Location",
                        enabledColor: isPlaceSelected
                            ? kcWhite
                            : theme.colorScheme.outline,
                        focusedColor: isPlaceSelected
                            ? kcWhite
                            : theme.colorScheme.outline,
                        errorColor: theme.colorScheme.error,
                      ),
                    ),
                    suggestionsCallback: (pattern) {
                      return viewModel.getSuggestions(pattern);
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        // leading: const Icon(Icons.shopping_cart),
                        title: Text(suggestion.name),
                        // subtitle: Text('\$${suggestion['price']}'),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      // Navigator.of(context).push<void>(MaterialPageRoute(
                      //   builder: (context) => ProductPage(product: suggestion)
                      // ));
                    },
                  ),
                  // AutoCompleteTextField<PlaceModel>(
                  //   suggestions: viewModel.placeList,
                  //   controller: placeController,
                  //   key: viewModel.keyController,
                  //   decoration: inputDecorationOne(
                  //     hint: "Search Places",
                  //     enabledColor:
                  //         isPlaceSelected ? kcWhite : theme.colorScheme.outline,
                  //     focusedColor:
                  //         isPlaceSelected ? kcWhite : theme.colorScheme.outline,
                  //     errorColor: theme.colorScheme.error,
                  //   ),
                  //   itemFilter: (PlaceModel? item, query) {
                  //     return item!.name
                  //         .toLowerCase()
                  //         .startsWith(query.toLowerCase());
                  //   },
                  //   itemSorter: (PlaceModel? a, PlaceModel b) {
                  //     return a!.name.compareTo(b.name);
                  //   },
                  //   itemSubmitted: (PlaceModel item) {
                  //     placeController.text = item.name;
                  //     viewModel.setSelectedPlace(item);
                  //   },
                  //   itemBuilder: (BuildContext context, PlaceModel item) {
                  //     return Container(
                  //       padding: const EdgeInsets.all(20),
                  //       child: Row(
                  //         children: [
                  //           Text(item.name,
                  //               style: manropeMedium.copyWith(
                  //                   fontSize: 14, color: kcBlack)),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                  verticalSpaceSmall,
                  verticalSpaceTiny,
                  ManropeText.semiBold("Date", 14,
                      isPlaceSelected ? kcWhite : theme.colorScheme.outline),
                  verticalSpaceSmall,
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: isPlaceSelected
                              ? kcWhite
                              : theme.colorScheme.outline),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 19),
                              child: ManropeText.regular(
                                  "From Date",
                                  14,
                                  isPlaceSelected
                                      ? kcWhite
                                      : theme.colorScheme.outline),
                            ),
                          ),
                          horizontalSpaceTiny,
                          VerticalDivider(
                            indent: 10,
                            endIndent: 10,
                            thickness: 1.5,
                            color: theme.colorScheme.outline,
                          ),
                          horizontalSpaceTiny,
                          Expanded(
                            child: ManropeText.regular(
                                "To Date",
                                14,
                                isPlaceSelected
                                    ? kcWhite
                                    : theme.colorScheme.outline),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Container(
        //   height: 40,
        //   width: 100,
        //   color: Colors.red,
        // )
      ],
    );
  }

  @override
  TripViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TripViewModel();
}
