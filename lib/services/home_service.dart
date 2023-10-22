import 'package:stacked/stacked.dart';
import 'package:travel_kenya/model/category_model.dart';
import 'package:travel_kenya/model/notification_model.dart';
import 'package:travel_kenya/model/place_model.dart';
import 'package:travel_kenya/ui/common/enums.dart';

class HomeService with ListenableServiceMixin {
  DateTime now = DateTime.now();
  List<CategoryModel> placesList = [
    CategoryModel(
      title: "Watamu Beach",
      description:
          "Mollit elit tempor ea deserunt veniam. Velit velit officia pariatur sit eiusmod in laboris sit labore. Deserunt non anim commodo minim sint voluptate dolor magna occaecat consectetur eiusmod in laboris.",
      tags: ["Beach"],
      images: [
        "https://images.unsplash.com/photo-1669335358428-4e9cf47859df?auto=format&fit=crop&q=80&w=2942&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
      categoryType: CategoryType.explore,
      place: PlaceModel(
        id: "",
        name: "Watamu, Kilifi",
        description: "",
        latitude: 0.0,
        longitude: 0.0,
      ),
    ),
    CategoryModel(
      title: "Pirates Beach",
      categoryType: CategoryType.explore,
      description:
          "Laborum adipisicing aliquip in duis minim. Velit nisi pariatur amet aliquip dolore sint aliquip duis. Sunt sit Lorem dolore elit id in minim pariatur velit id. Laboris exercitation proident pariatur magna nulla excepteur esse est. Cupidatat Lorem sit minim amet eu culpa occaecat.",
      tags: ["Beach"],
      images: [
        "https://images.unsplash.com/photo-1623317977555-5be922ef3f5f?auto=format&fit=crop&q=80&w=2874&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      ],
      place: PlaceModel(
        id: "",
        name: "Bamburi, Mombasa",
        description: "",
        latitude: 0.0,
        longitude: 0.0,
      ),
    ),
    CategoryModel(
      categoryType: CategoryType.explore,
      title: "Hells Gate",
      description:
          "Anim cupidatat proident ullamco ad id adipisicing quis eu fugiat sint. Labore nulla ex pariatur magna aliqua mollit in ea elit. Adipisicing nisi duis quis cillum sint aute laborum nulla Lorem ipsum officia est consectetur. Veniam mollit in ad mollit aute incididunt et laboris irure Lorem. Esse ullamco ipsum dolor ipsum veniam anim sint culpa ea et deserunt officia eu non.",
      tags: ["Scenery", "Wildlife"],
      images: [
        "https://images.unsplash.com/photo-1672651745723-d0b2b962a7f3?auto=format&fit=crop&q=80&w=2940&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      ],
      place: PlaceModel(
        id: "",
        name: "Hells Gate, Nakuru",
        description: "",
        latitude: 0.0,
        longitude: 0.0,
      ),
    ),
    CategoryModel(
      categoryType: CategoryType.explore,
      title: "Maasai Mara",
      description: "",
      tags: ["Wildlife", "Adventure", "Scenery"],
      images: [
        "https://images.unsplash.com/photo-1696231659533-bdb81ffaa661?auto=format&fit=crop&q=80&w=2940&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
      place: PlaceModel(
        id: "",
        name: "Maasai Mara",
        description: "",
        latitude: 0.0,
        longitude: 0.0,
      ),
    ),
    CategoryModel(
      categoryType: CategoryType.explore,
      title: "Nakuru National Park",
      description:
          "Ut deserunt ad fugiat elit velit. Pariatur sunt adipisicing consectetur ut et Lorem culpa reprehenderit officia cupidatat sint non esse eu. Ullamco ut commodo sunt consequat nostrud ipsum minim labore irure aliquip sunt quis. Excepteur labore magna deserunt elit.",
      tags: ["Adventure", "Wildlife", "Scenery"],
      images: [
        "https://images.unsplash.com/photo-1616431505321-8adf35f76a58?auto=format&fit=crop&q=80&w=2891&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      ],
      place: PlaceModel(
        id: "",
        name: "Nakuru",
        description: "",
        latitude: 0.0,
        longitude: 0.0,
      ),
    ),
    CategoryModel(
      categoryType: CategoryType.explore,
      title: "Lake Nakuru",
      description:
          "Lorem sint deserunt elit minim excepteur officia pariatur quis fugiat pariatur. Velit proident do ullamco consectetur et ex nostrud do dolore eiusmod. Sit ullamco duis occaecat anim duis sint qui qui. Ipsum consectetur excepteur cupidatat enim. Proident laborum mollit officia fugiat eiusmod. Veniam labore do irure nisi esse. Commodo ex pariatur mollit minim mollit est et consequat excepteur reprehenderit duis esse Lorem elit.",
      tags: ["Scenery", "Wildlife"],
      images: [
        "https://images.unsplash.com/photo-1623745493572-ef78d94249f3?auto=format&fit=crop&q=80&w=2952&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      ],
      place: PlaceModel(
        id: "",
        name: "Nakuru",
        description: "",
        latitude: 0.0,
        longitude: 0.0,
      ),
    ),
    CategoryModel(
      categoryType: CategoryType.explore,
      title: "Tsavo National Park",
      description:
          "Eu duis quis excepteur nulla sunt Lorem laboris commodo duis consectetur cillum do. Dolor enim id non sit et consectetur labore voluptate amet sint laboris elit in. Id labore voluptate culpa Lorem ex ullamco proident aute fugiat. Ex eiusmod excepteur sunt incididunt ex veniam fugiat dolore magna ipsum sunt veniam quis. Elit deserunt do do officia magna pariatur nisi fugiat commodo do exercitation magna nostrud. Ea Lorem non ipsum velit cupidatat laborum labore amet in ex labore dolore adipisicing.",
      tags: ["Wildlife", "Adventure"],
      images: [
        "https://images.unsplash.com/photo-1696231657232-a4f296e41b24?auto=format&fit=crop&q=80&w=2940&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      ],
      place: PlaceModel(
        id: "",
        name: "Voi",
        description: "",
        latitude: 0.0,
        longitude: 0.0,
      ),
    ),
    CategoryModel(
      categoryType: CategoryType.event,
      date: DateTime.now().copyWith(month: 12, day: 18),
      title: "Lamu Cultural Event",
      description:
          "Deserunt sint nisi esse minim do irure Lorem non. Velit dolor commodo ullamco cupidatat proident ipsum aliqua non quis est anim. Esse occaecat et deserunt fugiat cillum consectetur pariatur cupidatat velit. Ut consectetur sit ullamco elit consectetur. Ullamco commodo laborum ullamco laborum non sunt eiusmod officia fugiat aliquip amet anim incididunt do. Incididunt consectetur esse aliquip laborum laboris reprehenderit id officia proident aliquip. Adipisicing reprehenderit eu in ullamco tempor incididunt consequat eu consequat velit.",
      tags: ["Culture", "Scenery"],
      images: [
        "https://images.unsplash.com/photo-1602094777645-5701b6128003?auto=format&fit=crop&q=80&w=2934&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      ],
      place: PlaceModel(
        id: "",
        name: "Lamu",
        description: "",
        latitude: 0.0,
        longitude: 0.0,
      ),
    ),
    CategoryModel(
      title: "Maasai Cultural Event",
      categoryType: CategoryType.event,
      date: DateTime.now().copyWith(month: 7, day: 28),
      description:
          "Excepteur elit anim qui adipisicing eu occaecat do adipisicing do elit eiusmod eu labore. Veniam Lorem est commodo excepteur culpa mollit laborum laborum nulla. Irure ad laborum nostrud eiusmod est consectetur fugiat ut eu consectetur eiusmod. Ut voluptate elit ex commodo amet laboris elit. Velit proident aute enim consectetur minim consequat amet est. Sit veniam elit incididunt fugiat cupidatat nulla cupidatat.",
      tags: ["Culture"],
      images: [
        "https://images.unsplash.com/photo-1515658323406-25d61c141a6e?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGtlbnlhJTIwY3VsdHVyZXxlbnwwfHwwfHx8MA%3D%3D"
      ],
      place: PlaceModel(
        id: "",
        name: "Narok",
        description: "",
        latitude: 0.0,
        longitude: 0.0,
      ),
    )
  ];

  List<NotificationModel> notificationList = [
    NotificationModel(
      id: "1",
      title: "Aidarus Badawy",
      description: "Trip to Maasai Mara",
      image:
          "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?auto=format&fit=crop&q=80&w=2885&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      notificationType: NotificationType.mention,
      date: DateTime.now(),
    ),
    NotificationModel(
      id: "1",
      title: "Aidarus Badawy",
      description: "Maasai Mara Blog",
      image:
          "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?auto=format&fit=crop&q=80&w=2885&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      notificationType: NotificationType.comment,
      date: DateTime.now(),
    ),
    NotificationModel(
      id: "1",
      title: "Aidarus Badawy",
      description: "Lake Nakuru Trip",
      image:
          "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?auto=format&fit=crop&q=80&w=2885&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      notificationType: NotificationType.request,
      date: DateTime.now(),
    )
  ];
}
