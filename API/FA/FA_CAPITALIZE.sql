declare
  l_trans_rec                FA_API_TYPES.trans_rec_type;

  l_asset_hdr_rec            FA_API_TYPES.asset_hdr_rec_type;

  l_asset_fin_rec            FA_API_TYPES.asset_fin_rec_type;

   ln_request_id        NUMBER;

  l_return_status            VARCHAR2(1);

  l_mesg_count               number;

  l_mesg                     varchar2(512);

   lv_calling_func      VARCHAR2(80) := 'Shareoracleapps Wrapper';

begin

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

   



  l_asset_hdr_rec.asset_id       := 117281;





  l_asset_fin_rec.date_placed_in_service := '31-OCT-2024';
  FA_CIP_PUB.do_capitalization(

          p_api_version         => 1.0,

          p_init_msg_list       => FND_API.G_FALSE,

          p_commit              => FND_API.G_FALSE,

          p_validation_level    => FND_API.G_VALID_LEVEL_FULL,

          p_calling_fn          => lv_calling_func,

          x_return_status       => l_return_status,

          x_msg_count           => l_mesg_count,

          x_msg_data            => l_mesg,

          px_trans_rec          => l_trans_rec,

          px_asset_hdr_rec      => l_asset_hdr_rec,

          px_asset_fin_rec      => l_asset_fin_rec

     ); 



  l_mesg_count := fnd_msg_pub.count_msg;



  if l_mesg_count > 0 then



     l_mesg := chr(10) || substr(fnd_msg_pub.get

                                   (fnd_msg_pub.G_FIRST, fnd_api.G_FALSE),

                                    1, 250);

     dbms_output.put_line(l_mesg);



     for i in 1..(l_mesg_count - 1) loop

        l_mesg :=

                    substr(fnd_msg_pub.get

                           (fnd_msg_pub.G_NEXT,

                            fnd_api.G_FALSE), 1, 250);



        dbms_output.put_line(l_mesg);

     end loop;



     fnd_msg_pub.delete_msg();



  end if;



  if (l_return_status <> FND_API.G_RET_STS_SUCCESS) then

     dbms_output.put_line('FAILURE');

  else

     dbms_output.put_line('SUCCESS');

     dbms_output.put_line('THID' || to_char(l_trans_rec.transaction_header_id));

     Commit;

  end if;



EXCEPTION

   WHEN OTHERS THEN

       dbms_output.put_line('Error');

end;
