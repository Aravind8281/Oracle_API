DECLARE
   p_cust_acct_site_rec      hz_cust_account_site_v2pub.cust_acct_site_rec_type;
   x_cust_acct_site_id       NUMBER;
   x_cust_acct_site_return_status  VARCHAR2 (10);
   x_cust_acct_site_msg_count      NUMBER;
   x_cust_acct_site_msg_data       VARCHAR2 (2400);
   v_cust_acct_site_error_message  VARCHAR2 (2400);
   
   CURSOR c IS
      SELECT 
         cust_acct_site_id,
         cust_account_id,
         party_site_id,
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
         global_attribute_category,
         global_attribute1,
         global_attribute2,
         global_attribute3,
         global_attribute4,
         global_attribute5,
         global_attribute6,
         global_attribute7,
         global_attribute8,
         global_attribute9,
         global_attribute10,
         global_attribute11,
         global_attribute12,
         global_attribute13,
         global_attribute14,
         global_attribute15,
         global_attribute16,
         global_attribute17,
         global_attribute18,
         global_attribute19,
         global_attribute20,
         orig_system_reference,
         status,
         org_id,
         customer_category_code,
         language,
         key_account_flag,
         tp_header_id,
         ece_tp_location_code,
         primary_specialist_id,
         secondary_specialist_id,
         territory_id,
         territory,
         translated_customer_name,
         created_by_module,
         application_id
      FROM 
         AR.HZ_CUST_ACCT_SITES_ALL
      WHERE 
         party_site_id = 241430
         AND cust_account_id = 3591;
BEGIN
   fnd_global.apps_initialize (
      user_id        => -1,
      resp_id        => 20678,
      resp_appl_id   => 222
   );
   
   mo_global.set_policy_context ('S', 106);

   FOR i IN c LOOP
      p_cust_acct_site_rec.cust_account_id := i.cust_account_id;
      p_cust_acct_site_rec.party_site_id := 241435;
      p_cust_acct_site_rec.attribute_category := i.attribute_category;
      p_cust_acct_site_rec.attribute1 := i.attribute1;
      p_cust_acct_site_rec.attribute2 := i.attribute2;
      p_cust_acct_site_rec.attribute3 := i.attribute3;
      p_cust_acct_site_rec.attribute4 := i.attribute4;
      p_cust_acct_site_rec.attribute5 := i.attribute5;
      p_cust_acct_site_rec.attribute6 := i.attribute6;
      p_cust_acct_site_rec.attribute7 := i.attribute7;
      p_cust_acct_site_rec.attribute8 := i.attribute8;
      p_cust_acct_site_rec.attribute9 := i.attribute9;
      p_cust_acct_site_rec.attribute10 := i.attribute10;
      p_cust_acct_site_rec.attribute11 := i.attribute11;
      p_cust_acct_site_rec.attribute12 := i.attribute12;
      p_cust_acct_site_rec.attribute13 := i.attribute13;
      p_cust_acct_site_rec.attribute14 := i.attribute14;
      p_cust_acct_site_rec.attribute15 := i.attribute15;
      p_cust_acct_site_rec.attribute16 := i.attribute16;
      p_cust_acct_site_rec.attribute17 := i.attribute17;
      p_cust_acct_site_rec.attribute18 := i.attribute18;
      p_cust_acct_site_rec.attribute19 := i.attribute19;
      p_cust_acct_site_rec.attribute20 := i.attribute20;
      p_cust_acct_site_rec.global_attribute_category := i.global_attribute_category;
      p_cust_acct_site_rec.global_attribute1 := i.global_attribute1;
      p_cust_acct_site_rec.global_attribute2 := i.global_attribute2;
      p_cust_acct_site_rec.global_attribute3 := i.global_attribute3;
      p_cust_acct_site_rec.global_attribute4 := i.global_attribute4;
      p_cust_acct_site_rec.global_attribute5 := i.global_attribute5;
      p_cust_acct_site_rec.global_attribute6 := i.global_attribute6;
      p_cust_acct_site_rec.global_attribute7 := i.global_attribute7;
      p_cust_acct_site_rec.global_attribute8 := i.global_attribute8;
      p_cust_acct_site_rec.global_attribute9 := i.global_attribute9;
      p_cust_acct_site_rec.global_attribute10 := i.global_attribute10;
      p_cust_acct_site_rec.global_attribute11 := i.global_attribute11;
      p_cust_acct_site_rec.global_attribute12 := i.global_attribute12;
      p_cust_acct_site_rec.global_attribute13 := i.global_attribute13;
      p_cust_acct_site_rec.global_attribute14 := i.global_attribute14;
      p_cust_acct_site_rec.global_attribute15 := i.global_attribute15;
      p_cust_acct_site_rec.global_attribute16 := i.global_attribute16;
      p_cust_acct_site_rec.global_attribute17 := i.global_attribute17;
      p_cust_acct_site_rec.global_attribute18 := i.global_attribute18;
      p_cust_acct_site_rec.global_attribute19 := i.global_attribute19;
      p_cust_acct_site_rec.global_attribute20 := i.global_attribute20;
      
      p_cust_acct_site_rec.BILL_TO_FLAG := 'P';
      p_cust_acct_site_rec.SHIP_TO_FLAG := 'P';
      p_cust_acct_site_rec.status := i.status;
      p_cust_acct_site_rec.customer_category_code := i.customer_category_code;
      p_cust_acct_site_rec.language := i.language;
      p_cust_acct_site_rec.key_account_flag := i.key_account_flag;
      p_cust_acct_site_rec.tp_header_id := i.tp_header_id;
      p_cust_acct_site_rec.ece_tp_location_code := i.ece_tp_location_code;
      p_cust_acct_site_rec.primary_specialist_id := i.primary_specialist_id;
      p_cust_acct_site_rec.secondary_specialist_id := i.secondary_specialist_id;
      p_cust_acct_site_rec.territory_id := i.territory_id;
      p_cust_acct_site_rec.territory := i.territory;
      p_cust_acct_site_rec.translated_customer_name := i.translated_customer_name;
      p_cust_acct_site_rec.created_by_module := 'TCA_V2_API';
      p_cust_acct_site_rec.application_id := i.application_id;
      p_cust_acct_site_rec.org_id := 108;
      
      mo_global.init ('AR');

      HZ_CUST_ACCOUNT_SITE_V2PUB.CREATE_CUST_ACCT_SITE (
         'T',
         p_cust_acct_site_rec,
         x_cust_acct_site_id,
         x_cust_acct_site_return_status,
         x_cust_acct_site_msg_count,
         x_cust_acct_site_msg_data
      );

      DBMS_OUTPUT.put_line ('x_return_status = ' || SUBSTR (x_cust_acct_site_return_status, 1, 255));
      DBMS_OUTPUT.put_line ('x_msg_count = ' || TO_CHAR (x_cust_acct_site_msg_count));
      DBMS_OUTPUT.put_line ('Customer Account Site Id is = ' || TO_CHAR (x_cust_acct_site_id));
      DBMS_OUTPUT.put_line ('x_msg_data = ' || SUBSTR (x_cust_acct_site_msg_data, 1, 255));

      IF x_cust_acct_site_msg_count > 1 THEN
         FOR j IN 1 .. x_cust_acct_site_msg_count LOOP
            DBMS_OUTPUT.put_line (j || '. ' || SUBSTR (
               fnd_msg_pub.get (fnd_api.g_false), 1, 255));
            
            fnd_file.put_line (
               fnd_file.output,
               'ERROR in customer site creation: ' ||
               fnd_msg_pub.get (fnd_msg_pub.g_next, fnd_api.g_false)
            );
            
            v_cust_acct_site_error_message := 'ERROR in customer site creation: ' ||
               fnd_msg_pub.get (fnd_msg_pub.g_next, fnd_api.g_false);
            COMMIT;
         END LOOP;
      ELSE
         DBMS_OUTPUT.put_line ('Customer Site Created!');
         fnd_file.put_line (
            fnd_file.output,
            'Customer Site Created for -- ' || i.cust_account_id
         );
         COMMIT;
      END IF;
   END LOOP;

EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.put_line ('Exception Occurred');
END;
/
