select distinct
  (select siteCode from kenyaemr_etl.etl_default_facility_info) as FacilityId,
  d.unique_patient_no as PatientID,
d.patient_id as PatientPK,
  (select FacilityName from kenyaemr_etl.etl_default_facility_info) as  FacilityName,
fup.visit_id as VisitID,
case when (fup.visit_date < '2019-01-01' or fup.visit_date > '2020-01-01') then null else CAST(fup.visit_date AS DATE) end  AS ScheduledVisitDate,
'Out Patient ccc' as Service,
fup.visit_scheduled as VisitType,
fup.date_created as DateVisted
from kenyaemr_etl.etl_patient_hiv_followup fup join kenyaemr_etl.etl_patient_demographics d
on fup.patient_id=d.patient_id  where(fup.visit_date between '2019-01-01' and '2020-01-01');