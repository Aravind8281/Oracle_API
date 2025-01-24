DECLARE
    p_cust_site_use_rec      hz_cust_account_site_v2pub.cust_site_use_rec_type;
    p_customer_profile_rec   hz_customer_profile_v2pub.customer_profile_rec_type;
    x_cust_acct_site_id      NUMBER;
    x_return_status          VARCHAR(10);
    x_msg_count              NUMBER;
    x_msg_data               VARCHAR2(2400);
    x_site_use_id            NUMBER;
    V_ERROR_MESSAGE          VARCHAR2(2400);

    CURSOR c IS
        SELECT *
        FROM ar.hz_cust_site_uses_all
        WHERE cust_acct_site_id = 3591;

BEGIN
    fnd_global.apps_initialize(
        user_id        => -1,
        resp_id        => 20678,
        resp_appl_id   => 222
    );

    mo_global.set_policy_context(
        'S', 
        106
    );

    FOR i IN c LOOP
        p_cust_site_use_rec.cust_acct_site_id := 74066;
        p_cust_site_use_rec.site_use_code := i.site_use_code;
        p_cust_site_use_rec.primary_flag := i.primary_flag;
        p_cust_site_use_rec.status := i.status;
        p_cust_site_use_rec.location := i.location;
        p_cust_site_use_rec.contact_id := i.contact_id;
        p_cust_site_use_rec.bill_to_site_use_id := i.bill_to_site_use_id;
        p_cust_site_use_rec.sic_code := i.sic_code;
        p_cust_site_use_rec.payment_term_id := i.payment_term_id;
        p_cust_site_use_rec.gsa_indicator := i.gsa_indicator;
        p_cust_site_use_rec.ship_partial := i.ship_partial;
        p_cust_site_use_rec.ship_via := i.ship_via;
        p_cust_site_use_rec.fob_point := i.fob_point;
        p_cust_site_use_rec.order_type_id := i.order_type_id;
        p_cust_site_use_rec.price_list_id := i.price_list_id;
        p_cust_site_use_rec.freight_term := i.freight_term;
        p_cust_site_use_rec.warehouse_id := i.warehouse_id;
        p_cust_site_use_rec.territory_id := i.territory_id;
        p_cust_site_use_rec.attribute_category := i.attribute_category;
        p_cust_site_use_rec.attribute1 := i.attribute1;
        p_cust_site_use_rec.attribute2 := i.attribute2;
        p_cust_site_use_rec.attribute3 := i.attribute3;
        p_cust_site_use_rec.attribute4 := i.attribute4;
        p_cust_site_use_rec.attribute5 := i.attribute5;
        p_cust_site_use_rec.attribute6 := i.attribute6;
        p_cust_site_use_rec.attribute7 := i.attribute7;
        p_cust_site_use_rec.attribute8 := i.attribute8;
        p_cust_site_use_rec.attribute9 := i.attribute9;
        p_cust_site_use_rec.attribute10 := i.attribute10;
        p_cust_site_use_rec.tax_reference := i.tax_reference;
        p_cust_site_use_rec.sort_priority := i.sort_priority;
        p_cust_site_use_rec.tax_code := i.tax_code;
        p_cust_site_use_rec.attribute11 := i.attribute11;
        p_cust_site_use_rec.attribute12 := i.attribute12;
        p_cust_site_use_rec.attribute13 := i.attribute13;
        p_cust_site_use_rec.attribute14 := i.attribute14;
        p_cust_site_use_rec.attribute15 := i.attribute15;
        p_cust_site_use_rec.attribute16 := i.attribute16;
        p_cust_site_use_rec.attribute17 := i.attribute17;
        p_cust_site_use_rec.attribute18 := i.attribute18;
        p_cust_site_use_rec.attribute19 := i.attribute19;
        p_cust_site_use_rec.attribute20 := i.attribute20;
        p_cust_site_use_rec.attribute21 := i.attribute21;
        p_cust_site_use_rec.attribute22 := i.attribute22;
        p_cust_site_use_rec.attribute23 := i.attribute23;
        p_cust_site_use_rec.attribute24 := i.attribute24;
        p_cust_site_use_rec.attribute25 := i.attribute25;
        p_cust_site_use_rec.demand_class_code := i.demand_class_code;
        p_cust_site_use_rec.tax_header_level_flag := i.tax_header_level_flag;
        p_cust_site_use_rec.tax_rounding_rule := i.tax_rounding_rule;
        p_cust_site_use_rec.global_attribute1 := i.global_attribute1;
        p_cust_site_use_rec.global_attribute2 := i.global_attribute2;
        p_cust_site_use_rec.global_attribute3 := i.global_attribute3;
        p_cust_site_use_rec.global_attribute4 := i.global_attribute4;
        p_cust_site_use_rec.global_attribute5 := i.global_attribute5;
        p_cust_site_use_rec.global_attribute6 := i.global_attribute6;
        p_cust_site_use_rec.global_attribute7 := i.global_attribute7;
        p_cust_site_use_rec.global_attribute8 := i.global_attribute8;
        p_cust_site_use_rec.global_attribute9 := i.global_attribute9;
        p_cust_site_use_rec.global_attribute10 := i.global_attribute10;
        p_cust_site_use_rec.global_attribute11 := i.global_attribute11;
        p_cust_site_use_rec.global_attribute12 := i.global_attribute12;
        p_cust_site_use_rec.global_attribute13 := i.global_attribute13;
        p_cust_site_use_rec.global_attribute14 := i.global_attribute14;
        p_cust_site_use_rec.global_attribute15 := i.global_attribute15;
        p_cust_site_use_rec.global_attribute16 := i.global_attribute16;
        p_cust_site_use_rec.global_attribute17 := i.global_attribute17;
        p_cust_site_use_rec.global_attribute18 := i.global_attribute18;
        p_cust_site_use_rec.global_attribute19 := i.global_attribute19;
        p_cust_site_use_rec.global_attribute20 := i.global_attribute20;
        p_cust_site_use_rec.global_attribute_category := i.global_attribute_category;
        p_cust_site_use_rec.primary_salesrep_id := i.primary_salesrep_id;
        p_cust_site_use_rec.finchrg_receivables_trx_id := i.finchrg_receivables_trx_id;
        p_cust_site_use_rec.dates_negative_tolerance := i.dates_negative_tolerance;
        p_cust_site_use_rec.dates_positive_tolerance := i.dates_positive_tolerance;
        p_cust_site_use_rec.date_type_preference := i.date_type_preference;
        p_cust_site_use_rec.over_shipment_tolerance := i.over_shipment_tolerance;
        p_cust_site_use_rec.under_shipment_tolerance := i.under_shipment_tolerance;
        p_cust_site_use_rec.item_cross_ref_pref := i.item_cross_ref_pref;
        p_cust_site_use_rec.over_return_tolerance := i.over_return_tolerance;
        p_cust_site_use_rec.under_return_tolerance := i.under_return_tolerance;
        p_cust_site_use_rec.ship_sets_include_lines_flag := i.ship_sets_include_lines_flag;
        p_cust_site_use_rec.arrivalsets_include_lines_flag := i.arrivalsets_include_lines_flag;
        p_cust_site_use_rec.sched_date_push_flag := i.sched_date_push_flag;
        p_cust_site_use_rec.invoice_quantity_rule := i.invoice_quantity_rule;
        p_cust_site_use_rec.pricing_event := i.pricing_event;
        p_cust_site_use_rec.gl_id_rec := i.gl_id_rec;
        p_cust_site_use_rec.gl_id_rev := i.gl_id_rev;
        p_cust_site_use_rec.gl_id_tax := i.gl_id_tax;
        p_cust_site_use_rec.gl_id_freight := i.gl_id_freight;
        p_cust_site_use_rec.gl_id_clearing := i.gl_id_clearing;
        p_cust_site_use_rec.gl_id_unbilled := i.gl_id_unbilled;
        p_cust_site_use_rec.gl_id_unearned := i.gl_id_unearned;
        p_cust_site_use_rec.gl_id_unpaid_rec := i.gl_id_unpaid_rec;
        p_cust_site_use_rec.gl_id_remittance := i.gl_id_remittance;
        p_cust_site_use_rec.gl_id_factor := i.gl_id_factor;
        p_cust_site_use_rec.tax_classification := i.tax_classification;
        p_cust_site_use_rec.application_id := i.application_id;
        p_cust_site_use_rec.org_id := 108;
        p_cust_site_use_rec.created_by_module := 'TCA_V2_API';

        HZ_CUST_ACCOUNT_SITE_V2PUB.CREATE_CUST_SITE_USE(
            p_init_msg_list          => 'T',
            p_cust_site_use_rec      => p_cust_site_use_rec,
            p_customer_profile_rec   => p_customer_profile_rec,
            p_create_profile         => '',
            p_create_profile_amt     => '',
            x_site_use_id            => X_SITE_USE_ID,
            x_return_status          => x_return_status,
            x_msg_count              => x_msg_count,
            x_msg_data               => x_msg_data
        );

        dbms_output.put_line('x_return_status = ' || substr(x_return_status, 1, 255));
        dbms_output.put_line('x_msg_count = ' || TO_CHAR(x_msg_count));
        dbms_output.put_line('Customer Account Site Id is = ' || TO_CHAR(x_site_use_id));
        dbms_output.put_line('x_msg_data = ' || substr(x_msg_data, 1, 255));

        IF x_msg_count > 1 THEN
            FOR i IN 1..x_msg_count LOOP
                dbms_output.put_line(i || '.' || substr(
                    fnd_msg_pub.get(p_encoded => fnd_api.g_false), 1, 255));

                fnd_file.put_line(
                    fnd_file.output,
                    'ERROR in customer site creation' || fnd_msg_pub.get(fnd_msg_pub.g_next, fnd_api.g_false)
                );

                v_error_message := '-ERROR in customer site creation----' ||
                    fnd_msg_pub.get(fnd_msg_pub.g_next, fnd_api.g_false);

                COMMIT;
            END LOOP;
        ELSE
            dbms_output.put_line('customer Site Created :' || x_site_use_id);
            COMMIT;
        END IF;

    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Exception Occured');
END;
/
