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

class GenerateSite {
  static List<Site> getDataSites() {
    List<Site> sites = [];
    sites.add(Site(
      name: "Solo Leveling",
      url: "https://komikindo.tv/komik/823197-solo-leveling/",
      image: "images/sololeveling.png",
      description:
          "Manhwa Solo Leveling yang dibuat oleh komikus bernama Chugong 추공 ini bercerita tentang 10 tahun yang lalu, setelah Gerbang yang menghubungkan dunia nyata dengan dunia monster terbuka, beberapa orang biasa, setiap hari menerima kekuatan untuk berburu monster di dalam Gerbang. Mereka dikenal sebagai Pemburu. Namun, tidak semua Pemburu kuat. Nama saya Sung Jin-Woo, seorang Pemburu peringkat-E. Saya seseorang yang harus mempertaruhkan nyawanya di ruang bawah tanah paling rendah, Terlemah di Dunia. Tidak memiliki keterampilan apa pun untuk ditampilkan, saya hampir tidak mendapatkan uang yang dibutuhkan dengan bertarung di ruang bawah tanah berlevel rendah… setidaknya sampai saya menemukan ruang bawah tanah tersembunyi dengan kesulitan tersulit dalam ruang bawah tanah peringkat-D! Pada akhirnya, saat aku menerima kematian, tiba-tiba aku menerima kekuatan aneh, log pencarian yang hanya bisa kulihat, rahasia untuk naik level yang hanya aku yang tahu! Jika saya berlatih sesuai dengan pencarian saya dan monster yang diburu, level saya akan naik. Berubah dari Hunter terlemah menjadi Hunter S-rank terkuat!",
    ));
    sites.add(Site(
      name: "Wind Breaker Nii Satoru",
      url: "https://komikindo.tv/komik/632432-wind-breaker-nii-satoru/",
      image: "images/windbreaker.png",
      description:
          "Manga Wind Breaker (NII Satoru) yang dibuat oleh komikus bernama NII Satoru ini bercerita tentang Ini adalah legenda tentang Sakura yang nakal bangkit menjadi pahlawan! SMA Fuurin dikenal memiliki nilai tes terendah, dan petarung terkuat. Musim semi ini, Sakura Haruka memutuskan untuk mencapai puncak Fuurin, dan belajar dari alias SMA Fuurin, yaitu Boufuurin, yang bertindak sebagai perisai pelindung kota dan penduduknya. Sakura bergabung dengan grup ini sebagai anggota, dan pertarungannya untuk melindungi kota dimulai!",
    ));
    sites.add(Site(
      name: "Solo Max-Level Newbie",
      url: "https://komikindo.tv/komik/345900-solo-max-level-newbie/",
      image: "images/solomaxlvlnewbie.png",
      description:
          "Manhwa Solo Max-Level Newbie yang dibuat oleh komikus bernama WAN.Z ini bercerita tentang Jinhyuk, seorang Nutuber game, adalah satu-satunya orang yang melihat akhir dari game [Tower of Trials]. Namun, ketika popularitas game tersebut menurun, menjadi sulit baginya untuk terus mencari nafkah sebagai Nutuber game. Karena dia sudah melihat akhir permainan, dia akan berhenti bermain. Tapi hari itu, [Tower of Trials] menjadi kenyataan, dan Jinhyuk, yang tahu tentang setiap hal dalam game, mengambil alih segalanya lebih cepat.",
    ));
    sites.add(Site(
      name: "SSS-Class Suicide Hunter",
      url: "https://komikindo.tv/komik/542533-sss-class-suicide-hunter/",
      image: "images/sssSucideHunter.png",
      description:
          "Manhwa SSS-Class Suicide Hunter yang dibuat oleh komikus bernama Neida (네이다), Shin Noah (신노아) ini bercerita tentang Saya ingin keterampilan S-Rank juga! Aku sangat menginginkannya, aku bisa mati untuk itu! [Kamu telah membangkitkan skill S-Rank.] [Tapi itu hanya bekerja saat kamu mati.] HAH!? APA PUNYA MENDAPATKAN SATU JIKA SAYA MATI !?",
    ));
    sites.add(Site(
      name: "Omniscient Readers Viewpoint",
      url: "https://komikindo.tv/komik/544253-omniscient-readers-viewpoint/",
      image: "images/omniviest.png",
      description:
          "Omniscient Readers Viewpoint Manhwa adalah serial komik yang bertemakan Magic, Monsters dan juga mengandung demografis Shounen. Update chapter terbaru komik Omniscient Reader’s Viewpoint adalah tanggal April 24, 2024.",
    ));
    sites.add(Site(
      name: "Mercenary Enrollment",
      url: "https://komikindo.tv/komik/134596-mercenary-enrollment/",
      image: "images/marcenaryEnrollment.png",
      description:
          "Manhwa Mercenary Enrollment yang dibuat oleh komikus bernama YC ini bercerita tentang Yu Ijin adalah satu-satunya yang selamat dari kecelakaan pesawat saat dia masih kecil. Setelah menjadi tentara bayaran untuk bertahan hidup selama 10 tahun, ia kembali ke keluarganya di kampung halamannya.",
    ));
    sites.add(Site(
      name: "Lookism",
      url: "https://komikindo.tv/komik/950692-lookism/",
      image: "images/lookism.png",
      description:
          "Lookism Manhwa adalah serial komik yang bertemakan Delinquents, School Life, Supernatural dan juga mengandung demografis Shounen. Update chapter terbaru komik Lookism adalah tanggal April 26, 2024.",
    ));
    sites.add(Site(
      name: "Pick Me Up",
      url: "https://komikindo.tv/komik/776584-pick-me-up/",
      image: "images/pickmeup.png",
      description:
          "Manhwa Pick Me Up! yang dibuat oleh komikus bernama Hermod, nicesun ini bercerita tentang Tidak ada yang mencapai akhir penjara bawah tanah Gim gacha seluler dengan tingkat kesulitan ekstrem (Pick Me Up!). Master peringkat kelima dunia 'Loki', yang disebut Master of Master, kehilangan akal sehatnya saat membersihkan ruang bawah tanah. Karakter pahlawan di 'Loki' yang menjadi 'Han Israt'. 'Itu dia. Pasti dia yang membawaku!' Untuk kembali ke Bumi, Anda harus memimpin master dan pahlawan pemula untuk menerobos lantai 100 penjara bawah tanah! Kau menyentuh orang yang salah. Carry paksa Master Loki yang tidak mentolerir satu kekalahan pun.",
    ));
    return sites;
  }
}
