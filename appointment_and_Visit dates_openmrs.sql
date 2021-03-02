select distinct
'' AS SatelliteName,
  (select siteCode from kenyaemr_etl.etl_default_facility_info) as FacilityId,
  d.unique_patient_no as PatientID,
d.patient_id as PatientPK,
  (select FacilityName from kenyaemr_etl.etl_default_facility_info) as  FacilityName,
  (select siteCode from kenyaemr_etl.etl_default_facility_info) as siteCode,
fup.visit_id as VisitID,
case when (fup.visit_date < '2019-01-01' or fup.visit_date > '2020-01-01') then null else CAST(fup.visit_date AS DATE) end  AS VisitDate,
'Out Patient ccc' as Service,
fup.visit_scheduled as VisitType,
fup.date_created
#fup.date_last_modified as date_last_modified
from kenyaemr_etl.etl_patient_hiv_followup fup join kenyaemr_etl.etl_patient_demographics d
on fup.patient_id=d.patient_id  where(fup.visit_date between '2019-01-01' and '2020-01-01');# and visit_date > date_created   ;
#and visit_date != date_created   ;

#select * from etl_patient_demographics;

#desc etl_patient_demographics;
#desc etl_patient_hiv_followup