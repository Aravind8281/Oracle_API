set serveroutput on;

DECLARE
  l_contact_point_rec    hz_contact_point_v2pub.contact_point_rec_type;
  l_edi_rec              hz_contact_point_v2pub.edi_rec_type ;
  l_email_rec            hz_contact_point_v2pub.email_rec_type ;
  l_phone_rec            hz_contact_point_v2pub.phone_rec_type;
  l_telex_rec            hz_contact_point_v2pub.telex_rec_type ;
  l_web_rec              hz_contact_point_v2pub.web_rec_type;
  l_object_version_number NUMBER := 0;
  l_return_status        VARCHAR2(30);
  l_count number;
  l_data varchar2(2400);
BEGIN
  l_contact_point_rec.contact_point_id := 12040; -- Replace with actual value
  l_contact_point_rec.contact_point_type := 'EMAIL'; -- Replace with actual value
  l_contact_point_rec.status := 'ACTIVE'; -- Replace with actual value
  l_contact_point_rec.owner_table_name := 'HZ_PARTIES'; -- Replace with actual value
  l_contact_point_rec.owner_table_id := 24043; -- Replace with actual value
  l_contact_point_rec.primary_flag := 'Y'; -- Replace with actual value
  l_contact_point_rec.orig_system_reference := '12040'; -- Replace with actual value
  l_contact_point_rec.orig_system := 'SYSTEM1'; -- Replace with actual value
  l_contact_point_rec.content_source_type := 'SOURCE1'; -- Replace with actual value
  l_contact_point_rec.attribute_category := 'CATEGORY1'; -- Replace with actual value
  l_contact_point_rec.attribute1 := 'VALUE1'; -- Replace with actual attributes as needed
  l_contact_point_rec.attribute2 := 'VALUE2';
  -- Initialize other fields in l_contact_point_rec as required...

  l_edi_rec.edi_transaction_handling := 'HANDLE1'; -- Replace with actual value
  l_edi_rec.edi_id_number := 'EDI123'; -- Replace with actual value
  l_edi_rec.edi_payment_method := 'WIRE'; -- Replace with actual value
  -- Initialize other fields in l_edi_rec as required...

  l_email_rec.email_format := 'MAILTEXT'; -- Replace with actual value
  l_email_rec.email_address := 'aravind.venkatachalam@focusrtech.com'; -- Replace with actual value

  l_phone_rec.phone_calling_calendar := 'CALENDAR1'; -- Replace with actual value
  l_phone_rec.last_contact_dt_time := SYSDATE; -- Replace with actual value
  l_phone_rec.phone_area_code := '123'; 

  l_telex_rec.telex_number := 'TELEX123'; -- Replace with actual value

  l_web_rec.web_type := 'WEB'; -- Replace with actual value
  l_web_rec.url := 'http://example.com'; -- Replace with actual value

  hz_contact_point_v2pub.update_contact_point(
  p_init_msg_list=>FND_API.G_TRUE,
    p_contact_point_rec => l_contact_point_rec,
    p_edi_rec => l_edi_rec,
    p_email_rec => l_email_rec,
    p_phone_rec => l_phone_rec,
    p_telex_rec => l_telex_rec,
    p_web_rec => l_web_rec,
    p_object_version_number => l_object_version_number,
    x_return_status => l_return_status,
    x_msg_count  => l_count,
    x_msg_data => l_data
  );

  DBMS_OUTPUT.PUT_LINE('Return Status: ' || l_return_status||' '||l_count);
  for i in 1..l_count
  loop
  DBMS_OUTPUT.PUT_LINE('Message: ' || l_data);
  end loop;
  
END;
/
