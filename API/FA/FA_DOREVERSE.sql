DECLARE

   l_trans_rec       fa_api_types.trans_rec_type;

   l_asset_hdr_rec   fa_api_types.asset_hdr_rec_type;

   l_asset_fin_rec   fa_api_types.asset_fin_rec_type;

   ln_request_id     NUMBER;

   l_return_status   VARCHAR2(1);

   l_mesg_count      NUMBER;

   l_mesg            VARCHAR2(4000);

   lv_calling_func   VARCHAR2(80) := 'Shareoracleapps Wrapper';

BEGIN

   fnd_global.apps_initialize(

       user_id        =>-1,

       resp_id        => 20563,

       resp_appl_id   => 140

   );



   fa_srvr_msg.init_server_message;

   fa_debug_pkg.set_debug_flag(

       debug_flag   => 'YES'

   );

   ln_request_id := fnd_global.conc_request_id;

   fnd_profile.get(

       'LOGIN_ID',

       l_trans_rec.who_info.last_update_login

   );

   fnd_profile.get(

       'USER_ID',

       l_trans_rec.who_info.last_updated_by

   );

   IF

       (

           l_trans_rec.who_info.last_updated_by IS NULL

       )

   THEN

       l_trans_rec.who_info.last_updated_by :=-1;

   END IF;



   IF

       (

           l_trans_rec.who_info.last_update_login IS NULL

       )

   THEN

       l_trans_rec.who_info.last_update_login :=-1;

   END IF;



   l_trans_rec.who_info.last_update_date := SYSDATE;

   l_trans_rec.who_info.creation_date := SYSDATE;

   l_trans_rec.who_info.created_by := l_trans_rec.who_info.last_updated_by;



  -- asset header info

   l_asset_hdr_rec.asset_id := 117281;

   fa_cip_pub.do_reverse(

          -- std parameters

       p_api_version        =>1.0,

       p_init_msg_list      => fnd_api.g_false,

       p_commit             => fnd_api.g_true,

       p_validation_level   => fnd_api.g_valid_level_full,

       p_calling_fn         => lv_calling_func,

       x_return_status      => l_return_status,

       x_msg_count          => l_mesg_count,

       x_msg_data           => l_mesg,

          -- api parameters

       px_trans_rec         => l_trans_rec,

       px_asset_hdr_rec     => l_asset_hdr_rec,

       px_asset_fin_rec     => l_asset_fin_rec

   );



  --dump messages



   l_mesg_count := fnd_msg_pub.count_msg;

   IF

       l_mesg_count > 0

   THEN

       l_mesg := chr(10)

        || substr(

           fnd_msg_pub.get(

               fnd_msg_pub.g_first,

               fnd_api.g_false

           ),

           1,

           250

       );



       dbms_output.put_line(l_mesg);

       FOR i IN 1.. ( l_mesg_count - 1 ) LOOP

           l_mesg := substr(

               fnd_msg_pub.get(

                   fnd_msg_pub.g_next,

                   fnd_api.g_false

               ),

               1,

               250

           );



           dbms_output.put_line(l_mesg);

       END LOOP;



       fnd_msg_pub.delete_msg ();

   END IF;



   IF

       ( l_return_status <> fnd_api.g_ret_sts_success )

   THEN

       dbms_output.put_line('FAILURE');

   ELSE

       dbms_output.put_line('SUCCESS');

       dbms_output.put_line('THID' || TO_CHAR(l_trans_rec.transaction_header_id) );

       COMMIT;

   END IF;



EXCEPTION

   WHEN OTHERS THEN

       dbms_output.put_line('Error');

END;

/
