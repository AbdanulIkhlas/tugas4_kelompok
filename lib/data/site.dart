class Site {
  final String name;
  final String url;
  final String description;
  final String image;
  

  Site(
      {required this.name,
      required this.url,
      required this.image,
      required this.description});
}

class GenerateSite{
  static List<Site> getDataSites() {
    List<Site> sites = [];
    sites.add(Site(
      name: "Vidio",
      url: "https://www.vidio.com/",
      image: "images/404.jpg",
      description: "Vidio is a global platform that brings people together to share and discover content. Our mission is to help people discover, connect, and share content. ",
    ));
    sites.add(Site(
      name: "Netflix",
      url: "https://www.netflix.com/",
      image: "images/404.jpg",
      description: "Unlimited movies, TV shows, and more. Watch now.",
    ));
    sites.add(Site(
      name: "YouTube",
      url: "https://www.youtube.com/",
      image: "images/404.jpg",
      description: "Watch the best videos on YouTube.",
    ));
    sites.add(Site(
      name: "Twitch",
      url: "https://www.twitch.tv/",
      image: "images/404.jpg",
      description: "Watch live TV, play games & more on the world's largest community of gamers.",
    ));
    sites.add(Site(
      name: "Reddit",
      url: "https://www.reddit.com/",
      image: "images/404.jpg",
      description: "Reddit is a network of communities based on shared interests. Find what you're looking for or create your own community.",
    ));
    sites.add(Site(
      name: "TikTok",
      url: "https://www.tiktok.com/",
      image: "images/404.jpg",
      description: "Download the app | TikTok: Discover & Follow Your Favorite Creators on TikTok.",
    ));
    sites.add(Site(
      name: "Discord",
      url: "https://discord.com/",
      image: "images/404.jpg",
      description: "Discord is a communication platform designed for communities.",
    ));
    sites.add(Site(
      name: "Instagram",
      url: "https://www.instagram.com/",
      image: "images/404.jpg",
      description: "Instagram is a visual way to discover and connect with the world.",
    ));
    sites.add(Site(
      name: "Pinterest",
      url: "https://www.pinterest.com/",
      image: "images/404.jpg",
      description: "Discover ideas, save ideas, and get inspiration from the world's #1 platform for finding and saving what matters to you.",
    ));
    sites.add(Site(
      name: "Twitter",
      url: "https://www.twitter.com/",
      image: "images/404.jpg",
      description: "Find out what's happening. Follow your friends, enter a new world of discovery, and join the millions of conversations happening now.",
    ));
    return sites;
  }
}
