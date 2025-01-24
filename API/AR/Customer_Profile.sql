DECLARE
   p_customer_profile_rec      hz_customer_profile_v2pub.customer_profile_rec_type;
   x_cust_account_profile_id   NUMBER;
   x_return_status             VARCHAR(10);
   x_msg_count                 NUMBER;
   x_msg_data                  VARCHAR2(2400);

   CURSOR C IS
      SELECT *
        FROM HZ_CUSTOMER_PROFILES HCP
       WHERE CUST_ACCOUNT_ID = 3591;

BEGIN
   -- Initialize the application environment
   fnd_global.apps_initialize (
      user_id        => -1,
      resp_id        => 20678,
      resp_appl_id   => 222
   );

   -- Set policy context
   mo_global.set_policy_context ('S', 106);

   -- Loop through each record in the cursor
   FOR i IN C LOOP
      p_customer_profile_rec.cust_account_id := i.cust_account_id;
      p_customer_profile_rec.status := i.status;
      p_customer_profile_rec.collector_id := i.collector_id;
      p_customer_profile_rec.credit_analyst_id := i.credit_analyst_id;
      p_customer_profile_rec.credit_checking := i.credit_checking;
      p_customer_profile_rec.next_credit_review_date := i.next_credit_review_date;
      p_customer_profile_rec.tolerance := i.tolerance;
      p_customer_profile_rec.discount_terms := i.discount_terms;
      p_customer_profile_rec.dunning_letters := i.dunning_letters;
      p_customer_profile_rec.interest_charges := i.interest_charges;
      p_customer_profile_rec.send_statements := i.send_statements;
      p_customer_profile_rec.credit_balance_statements := i.credit_balance_statements;
      p_customer_profile_rec.credit_hold := i.credit_hold;
      p_customer_profile_rec.profile_class_id := i.profile_class_id;
      p_customer_profile_rec.site_use_id := i.site_use_id;
      p_customer_profile_rec.credit_rating := i.credit_rating;
      p_customer_profile_rec.risk_code := i.risk_code;
      p_customer_profile_rec.standard_terms := i.standard_terms;
      p_customer_profile_rec.override_terms := i.override_terms;
      p_customer_profile_rec.dunning_letter_set_id := i.dunning_letter_set_id;
      p_customer_profile_rec.interest_period_days := i.interest_period_days;
      p_customer_profile_rec.payment_grace_days := i.payment_grace_days;
      p_customer_profile_rec.discount_grace_days := i.discount_grace_days;
      p_customer_profile_rec.statement_cycle_id := i.statement_cycle_id;
      p_customer_profile_rec.account_status := i.account_status;
      p_customer_profile_rec.percent_collectable := i.percent_collectable;
      p_customer_profile_rec.autocash_hierarchy_id := i.autocash_hierarchy_id;
      p_customer_profile_rec.attribute_category := i.attribute_category;
      p_customer_profile_rec.attribute1 := i.attribute1;
      p_customer_profile_rec.attribute2 := i.attribute2;
      p_customer_profile_rec.attribute3 := i.attribute3;
      p_customer_profile_rec.attribute4 := i.attribute4;
      p_customer_profile_rec.attribute5 := i.attribute5;
      p_customer_profile_rec.attribute6 := i.attribute6;
      p_customer_profile_rec.attribute7 := i.attribute7;
      p_customer_profile_rec.attribute8 := i.attribute8;
      p_customer_profile_rec.attribute9 := i.attribute9;
      p_customer_profile_rec.attribute10 := i.attribute10;
      p_customer_profile_rec.attribute11 := i.attribute11;
      p_customer_profile_rec.attribute12 := i.attribute12;
      p_customer_profile_rec.attribute13 := i.attribute13;
      p_customer_profile_rec.attribute14 := i.attribute14;
      p_customer_profile_rec.attribute15 := i.attribute15;
      p_customer_profile_rec.auto_rec_incl_disputed_flag := i.auto_rec_incl_disputed_flag;
      p_customer_profile_rec.tax_printing_option := i.tax_printing_option;
      p_customer_profile_rec.charge_on_finance_charge_flag := i.charge_on_finance_charge_flag;
      p_customer_profile_rec.grouping_rule_id := i.grouping_rule_id;
      p_customer_profile_rec.clearing_days := i.clearing_days;
      p_customer_profile_rec.jgzz_attribute_category := i.jgzz_attribute_category;
      p_customer_profile_rec.jgzz_attribute1 := i.jgzz_attribute1;
      p_customer_profile_rec.jgzz_attribute2 := i.jgzz_attribute2;
      p_customer_profile_rec.jgzz_attribute3 := i.jgzz_attribute3;
      p_customer_profile_rec.jgzz_attribute4 := i.jgzz_attribute4;
      p_customer_profile_rec.jgzz_attribute5 := i.jgzz_attribute5;
      p_customer_profile_rec.jgzz_attribute6 := i.jgzz_attribute6;
      p_customer_profile_rec.jgzz_attribute7 := i.jgzz_attribute7;
      p_customer_profile_rec.jgzz_attribute8 := i.jgzz_attribute8;
      p_customer_profile_rec.jgzz_attribute9 := i.jgzz_attribute9;
      p_customer_profile_rec.jgzz_attribute10 := i.jgzz_attribute10;
      p_customer_profile_rec.jgzz_attribute11 := i.jgzz_attribute11;
      p_customer_profile_rec.jgzz_attribute12 := i.jgzz_attribute12;
      p_customer_profile_rec.jgzz_attribute13 := i.jgzz_attribute13;
      p_customer_profile_rec.jgzz_attribute14 := i.jgzz_attribute14;
      p_customer_profile_rec.jgzz_attribute15 := i.jgzz_attribute15;
      p_customer_profile_rec.global_attribute1 := i.global_attribute1;
      p_customer_profile_rec.global_attribute2 := i.global_attribute2;
      p_customer_profile_rec.global_attribute3 := i.global_attribute3;
      p_customer_profile_rec.global_attribute4 := i.global_attribute4;
      p_customer_profile_rec.global_attribute5 := i.global_attribute5;
      p_customer_profile_rec.global_attribute6 := i.global_attribute6;
      p_customer_profile_rec.global_attribute7 := i.global_attribute7;
      p_customer_profile_rec.global_attribute8 := i.global_attribute8;
      p_customer_profile_rec.global_attribute9 := i.global_attribute9;
      p_customer_profile_rec.global_attribute10 := i.global_attribute10;
      p_customer_profile_rec.global_attribute11 := i.global_attribute11;
      p_customer_profile_rec.global_attribute12 := i.global_attribute12;
      p_customer_profile_rec.global_attribute13 := i.global_attribute13;
      p_customer_profile_rec.global_attribute14 := i.global_attribute14;
      p_customer_profile_rec.global_attribute15 := i.global_attribute15;
      p_customer_profile_rec.global_attribute16 := i.global_attribute16;
      p_customer_profile_rec.global_attribute17 := i.global_attribute17;
      p_customer_profile_rec.global_attribute18 := i.global_attribute18;
      p_customer_profile_rec.global_attribute19 := i.global_attribute19;
      p_customer_profile_rec.global_attribute20 := i.global_attribute20;
      p_customer_profile_rec.global_attribute_category := i.global_attribute_category;
      p_customer_profile_rec.cons_inv_flag := i.cons_inv_flag;
      p_customer_profile_rec.cons_inv_type := i.cons_inv_type;
      p_customer_profile_rec.autocash_hierarchy_id_for_adr := i.autocash_hierarchy_id_for_adr;
      p_customer_profile_rec.lockbox_matching_option := i.lockbox_matching_option;
      p_customer_profile_rec.created_by_module := i.created_by_module;
      p_customer_profile_rec.application_id := i.application_id;
      p_customer_profile_rec.review_cycle := i.review_cycle;
      p_customer_profile_rec.last_credit_review_date := i.last_credit_review_date;
      p_customer_profile_rec.party_id := i.party_id;
      p_customer_profile_rec.credit_classification := i.credit_classification;
      p_customer_profile_rec.cons_bill_level := i.cons_bill_level;
      p_customer_profile_rec.late_charge_calculation_trx := i.late_charge_calculation_trx;
      p_customer_profile_rec.credit_items_flag := i.credit_items_flag;
      p_customer_profile_rec.disputed_transactions_flag := i.disputed_transactions_flag;
      p_customer_profile_rec.late_charge_type := i.late_charge_type;
      p_customer_profile_rec.late_charge_term_id := i.late_charge_term_id;
      p_customer_profile_rec.interest_calculation_period := i.interest_calculation_period;
      p_customer_profile_rec.hold_charged_invoices_flag := i.hold_charged_invoices_flag;
      p_customer_profile_rec.message_text_id := i.message_text_id;
      p_customer_profile_rec.multiple_interest_rates_flag := i.multiple_interest_rates_flag;
      p_customer_profile_rec.charge_begin_date := i.charge_begin_date;
      p_customer_profile_rec.automatch_set_id := i.automatch_set_id;

      -- Create customer profile
      hz_customer_profile_v2pub.create_customer_profile (
         'T',
         p_customer_profile_rec,
         '',
         x_cust_account_profile_id,
         x_return_status,
         x_msg_count,
         x_msg_data
      );

      -- Check return status and print appropriate message
      IF x_return_status = 'S' THEN
         DBMS_OUTPUT.PUT_LINE('PROFILE ID ' || x_cust_account_profile_id);
      ELSE
         DBMS_OUTPUT.PUT_LINE('Profile not created ' || x_msg_count || ' : ' || x_msg_data);
      END IF;
   END LOOP;

EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('EXCEPTION');
END;
/
