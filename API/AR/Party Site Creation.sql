DECLARE
   x_party_site_id       NUMBER;
   x_party_site_number   NUMBER;
   x_return_status       VARCHAR2(10);
   x_msg_count           NUMBER;
   x_msg_data            VARCHAR2(2400);
   p_party_site_rec      hz_party_site_v2pub.party_site_rec_type;
   
   CURSOR c IS
      SELECT 
         party_site_id,
         party_id,
         location_id,
         party_site_number,
         orig_system_reference,
         mailstop,
         identifying_address_flag,
         status,
         party_site_name,
         attribute_category,
         attribute1,
         attribute2,
         attribute3,
         attribute4,
         attribute5,
         attribute6,
         attribute7,
         attribute8,
         attribute9,
         attribute10,
         attribute11,
         attribute12,
         attribute13,
         attribute14,
         attribute15,
         attribute16,
         attribute17,
         attribute18,
         attribute19,
         attribute20,
         language,
         addressee,
         created_by_module,
         application_id,
         global_location_number,
         duns_number_c
      FROM 
         hz_party_sites
      WHERE 
         party_id = 269538 
         AND location_id = 9347;
BEGIN
   fnd_global.apps_initialize(user_id => -1, resp_id => 20678, resp_appl_id => 222);
   mo_global.set_policy_context('S', 106);

   FOR i IN c LOOP
      p_party_site_rec.orig_system_reference := i.orig_system_reference;
      p_party_site_rec.mailstop := i.mailstop;
      p_party_site_rec.status := i.status;
      p_party_site_rec.party_site_name := 'Test Site ';
      p_party_site_rec.attribute_category := i.attribute_category;
      p_party_site_rec.attribute1 := i.attribute1;
      p_party_site_rec.attribute2 := i.attribute2;
      p_party_site_rec.attribute3 := i.attribute3;
      p_party_site_rec.attribute4 := i.attribute4;
      p_party_site_rec.attribute5 := i.attribute5;
      p_party_site_rec.attribute6 := i.attribute6;
      p_party_site_rec.attribute7 := i.attribute7;
      p_party_site_rec.attribute8 := i.attribute8;
      p_party_site_rec.attribute9 := i.attribute9;
      p_party_site_rec.attribute10 := i.attribute10;
      p_party_site_rec.attribute11 := i.attribute11;
      p_party_site_rec.attribute12 := i.attribute12;
      p_party_site_rec.attribute13 := i.attribute13;
      p_party_site_rec.attribute14 := i.attribute14;
      p_party_site_rec.attribute15 := i.attribute15;
      p_party_site_rec.attribute16 := i.attribute16;
      p_party_site_rec.attribute17 := i.attribute17;
      p_party_site_rec.attribute18 := i.attribute18;
      p_party_site_rec.attribute19 := i.attribute19;
      p_party_site_rec.attribute20 := i.attribute20;
      p_party_site_rec.language := i.language;
      p_party_site_rec.addressee := i.addressee;
      p_party_site_rec.application_id := i.application_id;
      p_party_site_rec.global_location_number := i.global_location_number;
      p_party_site_rec.duns_number_c := i.duns_number_c;
      
      p_party_site_rec.party_id := 269538;
      p_party_site_rec.location_id := 9350;
      p_party_site_rec.identifying_address_flag := 'Y';
      p_party_site_rec.created_by_module := 'TCA_MIGRATION';

      HZ_PARTY_SITE_V2PUB.CREATE_PARTY_SITE(
         'T',
         p_party_site_rec,
         x_party_site_id,
         x_party_site_number,
         x_return_status,
         x_msg_count,
         x_msg_data
      );

      IF x_return_status = 'S' THEN
         DBMS_OUTPUT.PUT_LINE('Return Status: ' || x_return_status || 
            ' Return Message: ' || x_msg_data ||
            ' Party Site Number: ' || x_party_site_number ||
            ' Party Site Id: ' || x_party_site_id);
      ELSE
         DBMS_OUTPUT.PUT_LINE('Return Status: ' || x_return_status || 
            ' Return Message: ' || x_msg_data);
      END IF;
   END LOOP;
   
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
