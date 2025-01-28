class InspectionModel {
  final String id;
  final String roadName;
  final String roadCode;
  final String structureType;
  final String chainage;
  final String inspectionDate;
  final String conditionState;
  final String structureId;
  final String division;
  final String district;
  final String upazila;
  final String createdBy;
  final bool isDraft;

  InspectionModel({
    required this.id,
    required this.roadName,
    required this.roadCode,
    required this.structureType,
    required this.chainage,
    required this.inspectionDate,
    required this.conditionState,
    required this.structureId,
    required this.division,
    required this.district,
    required this.upazila,
    required this.createdBy,
    this.isDraft = false,
  });
}

final List<InspectionModel> demoInspections = [
  InspectionModel(
    id: '1',
    roadName: 'Sundargonj-Materhat G.C',
    roadCode: '132912005',
    structureType: 'Box Culvert',
    chainage: '4080',
    inspectionDate: '27-01-2025',
    conditionState: 'CS-4',
    structureId: '56276',
    division: 'Rangpur',
    district: 'Gaibandha',
    upazila: 'Sundarganj',
    createdBy: 'insp1.ect.rangpur',
  ),
];