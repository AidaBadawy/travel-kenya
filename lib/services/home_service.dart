import 'package:stacked/stacked.dart';
import 'package:travel_kenya/model/category_model.dart';
import 'package:travel_kenya/model/notification_model.dart';
import 'package:travel_kenya/model/place_model.dart';
import 'package:travel_kenya/model/trip_model.dart';
import 'package:travel_kenya/model/user_model.dart';
import 'package:travel_kenya/ui/common/enums.dart';

class HomeService with ListenableServiceMixin {
  DateTime now = DateTime.now();
  List<CategoryModel> categoryList = [
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
        image: "",
        id: "",
        name: "Watamu, Kilifi",
        description: "",
        location: LocationModel(latitude: 0, longitude: 0),
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
        image: "",
        id: "",
        name: "Bamburi, Mombasa",
        description: "",
        location: LocationModel(latitude: 0, longitude: 0),
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
        image: "",
        id: "",
        name: "Hells Gate, Nakuru",
        description: "",
        location: LocationModel(latitude: 0, longitude: 0),
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
        image: "",
        id: "",
        name: "Maasai Mara",
        description: "",
        location: LocationModel(latitude: 0, longitude: 0),
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
        image: "",
        id: "",
        name: "Nakuru",
        description: "",
        location: LocationModel(latitude: 0, longitude: 0),
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
        image: "",
        id: "",
        name: "Nakuru",
        description: "",
        location: LocationModel(latitude: 0, longitude: 0),
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
        image: "",
        id: "",
        name: "Voi",
        description: "",
        location: LocationModel(latitude: 0, longitude: 0),
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
        image: "",
        id: "",
        name: "Lamu",
        description: "",
        location: LocationModel(latitude: 0, longitude: 0),
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
        image: "",
        id: "",
        name: "Narok",
        description: "",
        location: LocationModel(latitude: 0, longitude: 0),
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

  List<TripModel> tripList = [
    TripModel(
      id: "",
      title: "Trip to Maasai Mara",
      description: "Sit est incididunt sunt proident do cillum et.",
      image:
          "https://images.unsplash.com/photo-1683561383748-28febc1066d4?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWFhc2FpJTIwbWFyYXxlbnwwfHwwfHx8MA%3D%3D",
      startDate: DateTime.now().copyWith(day: 12, month: 11),
      endDate: DateTime.now().copyWith(day: 17, month: 11),
      tripType: TripType.group,
      expense: [],
      place: PlaceModel(
        image: "",
        id: "0",
        description: "",
        name: "Maasai Mara",
        location: LocationModel(latitude: 0, longitude: 0),
      ),
      tags: [
        "Wildlife",
        "Adventure",
        "Scenery",
      ],
      activities: [
        TripActivity(
          id: "1",
          name: "Maasai Mara National Reserve",
          date: DateTime.now().copyWith(day: 12, month: 11),
          location: LocationModel(
            latitude: 0,
            longitude: 0,
          ),
        )
      ],
      users: [
        UserModel(
          id: "2",
          name: "Swaleh Arif",
          image:
              "https://images.unsplash.com/photo-1618641986557-1ecd230959aa?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
        ),
        UserModel(
          id: "3",
          name: "Abdallah Bahsan",
          image:
              "https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D",
        ),
        UserModel(
          id: "1",
          name: "Aidarus Badawy",
          image:
              "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?auto=format&fit=crop&q=80&w=2885&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ),
        UserModel(
            id: "4",
            name: "Badawy Abdallah",
            image:
                "https://images.unsplash.com/photo-1534308143481-c55f00be8bd7?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHVzZXIlMjBwcm9maWxlfGVufDB8fDB8fHww")
      ],
    ),
    TripModel(
      id: "2",
      title: "Amboseli Adventure",
      description: "Sit est incididunt sunt proident do cillum et.",
      tripType: TripType.group,
      place: PlaceModel(
        image: "",
        id: "0",
        description: "",
        name: "Amboseli",
        location: LocationModel(latitude: 0, longitude: 0),
      ),
      image:
          "https://images.unsplash.com/photo-1612126312146-2c132bb326df?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fEFtYm9zZWxpfGVufDB8fDB8fHww",
      startDate: DateTime.now().copyWith(day: 7, month: 12),
      endDate: DateTime.now().copyWith(day: 15, month: 12),
      expense: [],
      tags: [
        "Wildlife",
        "Adventure",
      ],
      activities: [
        TripActivity(
          id: "1",
          name: "Ambosel National Park",
          date: DateTime.now().copyWith(day: 7, month: 12),
          location: LocationModel(
            latitude: 0,
            longitude: 0,
          ),
        )
      ],
      users: [
        UserModel(
          id: "1",
          name: "Aidarus Badawy",
          image:
              "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?auto=format&fit=crop&q=80&w=2885&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ),
        UserModel(
          id: "2",
          name: "Swaleh Arif",
          image:
              "https://images.unsplash.com/photo-1618641986557-1ecd230959aa?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
        ),
        UserModel(
          id: "3",
          name: "Abdallah Bahsan",
          image:
              "https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D",
        )
      ],
    ),
    TripModel(
      id: "2",
      title: "Mombasa Tour",
      description: "Sit est incididunt sunt proident do cillum et.",
      tripType: TripType.personal,
      place: PlaceModel(
        image: "",
        id: "0",
        description: "",
        name: "Mombasa",
        location: LocationModel(latitude: 0, longitude: 0),
      ),
      image:
          "https://images.unsplash.com/photo-1560564029-6eb181a872c4?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bW9tYmFzYXxlbnwwfHwwfHx8MA%3D%3D",
      startDate: DateTime.now().copyWith(day: 7, month: 12),
      endDate: DateTime.now().copyWith(day: 15, month: 12),
      expense: [],
      tags: [
        "Beach",
        "Scenery",
        "Culture",
      ],
      activities: [
        TripActivity(
          id: "1",
          name: "Mombasa",
          date: DateTime.now().copyWith(day: 7, month: 12),
          location: LocationModel(
            latitude: 0,
            longitude: 0,
          ),
        )
      ],
      users: [
        UserModel(
          id: "1",
          name: "Aidarus Badawy",
          image:
              "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?auto=format&fit=crop&q=80&w=2885&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ),
      ],
    )
  ];

  List<PlaceModel> placesList = [
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1535349838154-27b18aa98c2d?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bW9tYmFzYXxlbnwwfHwwfHx8MA%3D%3D",
      id: "1",
      name: "Mombasa",
      description:
          "Sit do veniam voluptate aliqua cupidatat eiusmod sint ea ex culpa id fugiat ad minim.",
      location: LocationModel(latitude: 0, longitude: 0),
    ),
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1627981584479-9605e4e7d1d0?auto=format&fit=crop&q=80&w=2172&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      id: "1",
      name: "Malindi",
      description:
          "Sit do veniam voluptate aliqua cupidatat eiusmod sint ea ex culpa id fugiat ad minim.",
      location: LocationModel(latitude: 0, longitude: 0),
    ),
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1611348524140-53c9a25263d6?auto=format&fit=crop&q=80&w=2946&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      id: "1",
      name: "Nairobi",
      description:
          "Sit do veniam voluptate aliqua cupidatat eiusmod sint ea ex culpa id fugiat ad minim.",
      location: LocationModel(latitude: 0, longitude: 0),
    ),
    PlaceModel(
      image:
          "https://cdn.pixabay.com/photo/2023/02/02/16/55/lions-7763320_1280.jpg",
      id: "1",
      name: "Maasai Mara",
      description:
          "Sit do veniam voluptate aliqua cupidatat eiusmod sint ea ex culpa id fugiat ad minim.",
      location: LocationModel(latitude: 0, longitude: 0),
    ),
    PlaceModel(
      image:
          "https://cdn.pixabay.com/photo/2022/07/15/05/12/mount-kilimanjaro-7322362_1280.jpg",
      id: "1",
      name: "Amboseli",
      description:
          "Sit do veniam voluptate aliqua cupidatat eiusmod sint ea ex culpa id fugiat ad minim.",
      location: LocationModel(latitude: 0, longitude: 0),
    ),
    PlaceModel(
      image:
          "https://cdn.pixabay.com/photo/2019/07/29/21/15/warrior-4371555_1280.jpg",
      id: "1",
      name: "Samburu",
      description:
          "Sit do veniam voluptate aliqua cupidatat eiusmod sint ea ex culpa id fugiat ad minim.",
      location: LocationModel(latitude: 0, longitude: 0),
    ),
    PlaceModel(
      image:
          "https://cdn.pixabay.com/photo/2016/06/28/14/34/pink-flamingo-1484781_1280.jpg",
      id: "1",
      name: "Nakuru",
      description:
          "Sit do veniam voluptate aliqua cupidatat eiusmod sint ea ex culpa id fugiat ad minim.",
      location: LocationModel(latitude: 0, longitude: 0),
    ),
    PlaceModel(
      image:
          "https://cdn.pixabay.com/photo/2019/03/15/08/26/africa-4056513_1280.jpg",
      id: "1",
      name: "Tsavo",
      description:
          "Sit do veniam voluptate aliqua cupidatat eiusmod sint ea ex culpa id fugiat ad minim.",
      location: LocationModel(latitude: 0, longitude: 0),
    ),
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1629553032544-3c1477c0eac9?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bGFtdXxlbnwwfHwwfHx8MA%3D%3D",
      id: "1",
      name: "Lamu",
      description:
          "Sit do veniam voluptate aliqua cupidatat eiusmod sint ea ex culpa id fugiat ad minim.",
      location: LocationModel(latitude: 0, longitude: 0),
    ),
    PlaceModel(
      image:
          "https://cdn.pixabay.com/photo/2019/03/13/09/15/africa-4052509_1280.jpg",
      id: "1",
      name: "Diani",
      description:
          "Sit do veniam voluptate aliqua cupidatat eiusmod sint ea ex culpa id fugiat ad minim.",
      location: LocationModel(latitude: 0, longitude: 0),
    ),
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1535703215941-fdfbcb818738?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW91bnQlMjBrZW55YXxlbnwwfHwwfHx8MA%3D%3D",
      id: "1",
      name: "Mount Kenya",
      description:
          "Sit do veniam voluptate aliqua cupidatat eiusmod sint ea ex culpa id fugiat ad minim.",
      location: LocationModel(latitude: 0, longitude: 0),
    ),
    PlaceModel(
      image: "",
      id: "1",
      name: "Samburu",
      description:
          "Sit do veniam voluptate aliqua cupidatat eiusmod sint ea ex culpa id fugiat ad minim.",
      location: LocationModel(latitude: 0, longitude: 0),
    ),
  ];
}
