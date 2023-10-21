import 'package:stacked/stacked.dart';
import 'package:travel_kenya/model/place_model.dart';

class HomeService with ListenableServiceMixin {
  List<PlaceModel> placesList = [
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1669335358428-4e9cf47859df?auto=format&fit=crop&q=80&w=2942&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      location: "Watamu Beach",
      description:
          "Reprehenderit aliqua id officia ut ex Lorem sint. In qui mollit commodo in. Consequat sint cillum culpa id officia pariatur. Fugiat qui anim mollit excepteur qui. Magna ea ut incididunt quis culpa laboris culpa irure. Magna mollit adipisicing nulla consequat dolore laboris. Amet ipsum ipsum consectetur Lorem tempor duis magna ut ad officia nulla.",
      tags: ["Beach"],
    ),
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1623317977555-5be922ef3f5f?auto=format&fit=crop&q=80&w=2874&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      location: "Pirates Beach",
      description:
          "Voluptate consectetur eu nisi nisi tempor ad aute sunt cupidatat veniam. Pariatur veniam elit est minim ex eu deserunt tempor duis commodo labore reprehenderit. Culpa nulla cupidatat ut commodo ipsum quis officia ut commodo. Aliqua ut in veniam veniam cupidatat pariatur duis. Sint enim magna fugiat adipisicing sit. Ipsum ipsum ipsum qui id laborum laboris dolor magna irure occaecat laborum.",
      tags: ["Beach"],
    ),
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1672651745723-d0b2b962a7f3?auto=format&fit=crop&q=80&w=2940&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      location: "Hells Gate",
      description:
          "Proident voluptate adipisicing quis amet laboris consectetur incididunt. Sint minim ipsum mollit officia ad est incididunt proident exercitation enim. Laborum proident esse aute anim quis in veniam dolore enim ad. Proident non Lorem laboris ipsum voluptate veniam voluptate exercitation commodo.",
      tags: ["Scenery"],
    ),
    PlaceModel(
        image:
            "https://images.unsplash.com/photo-1696231659533-bdb81ffaa661?auto=format&fit=crop&q=80&w=2940&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        location: "Maasai Mara",
        description: "Fugiat dolore ea Lorem dolor qui Lorem nulla consectetur. Ullamco in anim non veniam tempor ea reprehenderit et occaecat id exercitation do. Et duis ex nisi velit minim fugiat aliqua aute proident do enim. Velit cupidatat enim ullamco nulla aliquip veniam sint irure aliqua elit reprehenderit. Esse in velit reprehenderit nisi. Dolor laborum qui Lorem velit laboris officia.",
        tags: ["Scenery"]),
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1616431505321-8adf35f76a58?auto=format&fit=crop&q=80&w=2891&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      location: "Nakuru Park",
      description:
          "Eu nostrud reprehenderit occaecat sint. Minim et veniam ut elit reprehenderit eiusmod do eu. Deserunt quis ex reprehenderit ad irure nostrud cillum deserunt nulla ullamco pariatur do. Anim cillum Lorem eiusmod ea aute. Dolore officia commodo consequat amet aliqua duis cillum ex sint eu amet sit magna.",
      tags: ["Adventure"],
    ),
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1696231659224-238807a99a06?auto=format&fit=crop&q=80&w=2940&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      location: "Maasai Mara",
      description:
          "Veniam velit labore sint cillum eiusmod consectetur eu cillum consectetur ullamco elit. Officia deserunt aliqua occaecat ex consectetur ut amet excepteur anim dolore qui duis anim. Non esse minim aliquip ex occaecat eu fugiat magna sint id est officia duis magna. Do laboris qui aute occaecat adipisicing eiusmod esse ipsum est qui amet. Consectetur reprehenderit ad dolor deserunt non deserunt cupidatat nostrud commodo dolore tempor ipsum ad occaecat.",
      tags: ["Adventure"],
    ),
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1623745493572-ef78d94249f3?auto=format&fit=crop&q=80&w=2952&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      location: "Lake Nakuru",
      description:
          "Officia consectetur in officia dolore in mollit pariatur ea occaecat magna ex est reprehenderit magna. Est cillum laborum duis dolore ipsum. Ullamco incididunt fugiat in do est.",
      tags: ["Wildlife"],
    ),
    PlaceModel(
      image:
          'https://images.unsplash.com/photo-1696231657232-a4f296e41b24?auto=format&fit=crop&q=80&w=2940&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      location: "Tsavo Park",
      description:
          "Cillum nisi consectetur anim ad. Ad duis proident minim quis nisi non enim laborum nisi commodo nulla. Eiusmod elit sint culpa excepteur duis nulla veniam. Laborum anim proident consequat culpa est nulla duis laboris.",
      tags: ["Wildlife"],
    ),
    PlaceModel(
        image:
            "https://images.unsplash.com/photo-1504616516087-fca44d1f8737?auto=format&fit=crop&q=80&w=2500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        location: "Maasai Mara",
        description: "Id consectetur ut velit nisi. Amet enim mollit amet tempor aliquip consequat duis anim pariatur. Cupidatat id deserunt nulla culpa amet eiusmod et dolore. Pariatur Lorem amet aliqua ea minim veniam sunt dolor occaecat in. Quis quis sint sit labore laboris anim dolor mollit Lorem magna. Exercitation labore elit enim magna velit quis proident. Consequat anim laborum aliqua aliqua enim.",
        tags: ["Wildlife"]),
    PlaceModel(
        image:
            "https://images.unsplash.com/photo-1515658323406-25d61c141a6e?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGtlbnlhJTIwY3VsdHVyZXxlbnwwfHwwfHx8MA%3D%3D",
        location: "Maasai Culture",
        description: "Excepteur nulla consectetur dolor commodo. Mollit do ad proident anim. Fugiat commodo incididunt exercitation est esse ut ad dolor excepteur incididunt exercitation enim aute.",
        tags: ["Culture"]),
    PlaceModel(
        image:
            "https://images.unsplash.com/photo-1602094777645-5701b6128003?auto=format&fit=crop&q=80&w=2934&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        location: "Lamu Culture",
        description: "Eu aliquip deserunt tempor fugiat non id Lorem tempor proident proident laborum cillum. Adipisicing veniam ad eu sint labore excepteur ut pariatur enim ad ipsum incididunt. Laborum est cupidatat nulla anim laboris sint.",
        tags: ["Culture"])
  ];
}
