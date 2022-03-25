class SelectedData {
  static CampingData? selectedItem;
}

class CampingData {
  late String intro;
  late String lineIntro;
  late String addr1;
  late String addr2 = '';
  late int allar;
  late String animalCmgCl;
  late int autoSiteCo;
  late String caravAcmpnyAt;
  late int caravSiteCo;
  late int contentId;
  late String clturEventAt;
  late String eqpmnLendCl;
  late String exprnProgrmAt;
  late String facltNm;
  late String featureNm = '';
  late String firstImageUrl;
  late String homepage;
  late String induty;
  late int indvdlCaravSiteCo;
  late String lctCl;
  late String operDeCl;
  late String operPdCl;
  late String posblFcltyCl;
  late String resveCl;
  late String resveUrl;
  late String sbrsCl;
  late String doNm;
  late String sigunguNm;
  late int swrmCo;
  late String tel;
  late int toiletCo;
  late String trlerAcmpnyAt;
  late int wtrplCo;

  late final List<Map> featureList = [
    {"name": "반려동물 동반", "value": this.animalCmgCl},
    {"name": "개인 카라반", "value": this.caravAcmpnyAt},
    {"name": "자체 문화행사", "value": this.clturEventAt},
    {"name": "체험 프로그램", "value": this.exprnProgrmAt},
    {"name": "개인 트레일러", "value": this.trlerAcmpnyAt},
  ];

  CampingData({
    required this.intro,
    required this.lineIntro,
    required this.addr1,
    required this.addr2,
    required this.allar,
    required this.animalCmgCl,
    required this.autoSiteCo,
    required this.caravAcmpnyAt,
    required this.caravSiteCo,
    required this.contentId,
    required this.clturEventAt,
    required this.doNm,
    required this.eqpmnLendCl,
    required this.exprnProgrmAt,
    required this.facltNm,
    required this.featureNm,
    required this.firstImageUrl,
    required this.homepage,
    required this.induty,
    required this.indvdlCaravSiteCo,
    required this.lctCl,
    required this.operDeCl,
    required this.operPdCl,
    required this.posblFcltyCl,
    required this.resveCl,
    required this.resveUrl,
    required this.sbrsCl,
    required this.sigunguNm,
    required this.swrmCo,
    required this.tel,
    required this.toiletCo,
    required this.trlerAcmpnyAt,
    required this.wtrplCo,
  });

  CampingData.fromJson(Map<String, dynamic> json) {
    intro = json['intro'] ?? '';
    lineIntro = json['lineIntro'] ?? '';
    addr1 = json['addr1'] ?? '';
    allar = json['allar'] ?? '';
    animalCmgCl = json['animalCmgCl'] ?? '';
    autoSiteCo = json['autoSiteCo'] ?? '';
    caravAcmpnyAt = json['caravAcmpnyAt'] ?? '';
    caravSiteCo = json['caravSiteCo'] ?? '';
    contentId = json['contentId'] ?? '';
    clturEventAt = json['clturEventAt'] ?? '';
    doNm = json['doNm'] ?? '';
    eqpmnLendCl = json['eqpmnLendCl'] ?? '';
    exprnProgrmAt = json['exprnProgrmAt'] ?? '';
    facltNm = json['facltNm'] ?? '';
    featureNm = json['featureNm'] ?? '';
    firstImageUrl = json['firstImageUrl'] ?? "";
    homepage = json['homepage'] ?? '';
    induty = json['induty'] ?? '';
    indvdlCaravSiteCo = json['indvdlCaravSiteCo'] ?? '';
    lctCl = json['lctCl'] ?? '';
    operDeCl = json['operDeCl'] ?? '';
    operPdCl = json['operPdCl'] ?? '';
    posblFcltyCl = json['posblFcltyCl'] ?? '';
    resveCl = json['resveCl'] ?? '';
    resveUrl = json['resveUrl'] ?? '';
    sbrsCl = json['sbrsCl'] ?? '';
    sigunguNm = json['sigunguNm'] ?? '';
    swrmCo = json['swrmCo'] ?? '';
    tel = json['tel'] ?? '';
    toiletCo = json['toiletCo'] ?? '';
    trlerAcmpnyAt = json['trlerAcmpnyAt'] ?? '' ?? '';
    wtrplCo = json['wtrplCo'] ?? '';
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
    data['clturEventAt'] = this.clturEventAt;
    data['doNm'] = this.doNm;
    data['eqpmnLendCl'] = this.eqpmnLendCl;
    data['exprnProgrmAt'] = this.exprnProgrmAt;
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
