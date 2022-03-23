class CampingData {
  String? addr1;
  String? addr2;
  int? allar;
  String? animalCmgCl;
  int? autoSiteCo;
  String? caravAcmpnyAt;
  int? caravSiteCo;
  int? contentId;
  String? eqpmnLendCl;
  String? facltNm;
  late String firstImageUrl;
  String? homepage;
  String? induty;
  int? indvdlCaravSiteCo;
  String? lctCl;
  String? operDeCl;
  String? operPdCl;
  String? posblFcltyCl;
  String? resveCl;
  String? resveUrl;
  String? sbrsCl;
  String? doNm;
  String? sigunguNm;
  int? swrmCo;
  String? tel;
  int? toiletCo;
  String? trlerAcmpnyAt;
  int? wtrplCo;

  CampingData({
    this.addr1,
    this.addr2,
    this.allar,
    this.animalCmgCl,
    this.autoSiteCo,
    this.caravAcmpnyAt,
    this.caravSiteCo,
    this.contentId,
    this.doNm,
    this.eqpmnLendCl,
    this.facltNm,
    required this.firstImageUrl,
    this.homepage,
    this.induty,
    this.indvdlCaravSiteCo,
    this.lctCl,
    this.operDeCl,
    this.operPdCl,
    this.posblFcltyCl,
    this.resveCl,
    this.resveUrl,
    this.sbrsCl,
    this.sigunguNm,
    this.swrmCo,
    this.tel,
    this.toiletCo,
    this.trlerAcmpnyAt,
    this.wtrplCo,
  });

  CampingData.fromJson(Map<String, dynamic> json) {
    addr1 = json['addr1'];
    allar = json['allar'];
    animalCmgCl = json['animalCmgCl'];
    autoSiteCo = json['autoSiteCo'];
    caravAcmpnyAt = json['caravAcmpnyAt'];
    caravSiteCo = json['caravSiteCo'];
    contentId = json['contentId'];
    doNm = json['doNm'];
    eqpmnLendCl = json['eqpmnLendCl'];
    facltNm = json['facltNm'];
    firstImageUrl =
        json['firstImageUrl'] ?? "https://i.ibb.co/2ypYwdr/no-photo.png";
    homepage = json['homepage'];
    induty = json['induty'];
    indvdlCaravSiteCo = json['indvdlCaravSiteCo'];
    lctCl = json['lctCl'];
    operDeCl = json['operDeCl'];
    operPdCl = json['operPdCl'];
    posblFcltyCl = json['posblFcltyCl'];
    resveCl = json['resveCl'];
    resveUrl = json['resveUrl'];
    sbrsCl = json['sbrsCl'];
    sigunguNm = json['sigunguNm'];
    swrmCo = json['swrmCo'];
    tel = json['tel'];
    toiletCo = json['toiletCo'];
    trlerAcmpnyAt = json['trlerAcmpnyAt'];
    wtrplCo = json['wtrplCo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addr1'] = this.addr1;
    data['allar'] = this.allar;
    data['animalCmgCl'] = this.animalCmgCl;
    data['autoSiteCo'] = this.autoSiteCo;
    data['caravAcmpnyAt'] = this.caravAcmpnyAt;
    data['caravSiteCo'] = this.caravSiteCo;
    data['contentId'] = this.contentId;
    data['doNm'] = this.doNm;
    data['eqpmnLendCl'] = this.eqpmnLendCl;
    data['facltNm'] = this.facltNm;
    data['firstImageUrl'] = this.firstImageUrl;
    data['homepage'] = this.homepage;
    data['induty'] = this.induty;
    data['indvdlCaravSiteCo'] = this.indvdlCaravSiteCo;
    data['lctCl'] = this.lctCl;
    data['operDeCl'] = this.operDeCl;
    data['operPdCl'] = this.operPdCl;
    data['posblFcltyCl'] = this.posblFcltyCl;
    data['resveCl'] = this.resveCl;
    data['resveUrl'] = this.resveUrl;
    data['sbrsCl'] = this.sbrsCl;
    data['sigunguNm'] = this.sigunguNm;
    data['swrmCo'] = this.swrmCo;
    data['tel'] = this.tel;
    data['toiletCo'] = this.toiletCo;
    data['trlerAcmpnyAt'] = this.trlerAcmpnyAt;
    data['wtrplCo'] = this.wtrplCo;
    return data;
  }
}
