DECLARE
   l_trans_rec                FA_API_TYPES.trans_rec_type;
   l_dist_trans_rec           FA_API_TYPES.trans_rec_type;
   l_asset_hdr_rec            FA_API_TYPES.asset_hdr_rec_type;
   l_asset_desc_rec           FA_API_TYPES.asset_desc_rec_type;
   l_asset_cat_rec            FA_API_TYPES.asset_cat_rec_type;
   l_asset_type_rec           FA_API_TYPES.asset_type_rec_type;
   l_asset_hierarchy_rec      FA_API_TYPES.asset_hierarchy_rec_type;
   l_asset_fin_rec            FA_API_TYPES.asset_fin_rec_type;
   l_asset_deprn_rec          FA_API_TYPES.asset_deprn_rec_type;
   l_asset_dist_rec           FA_API_TYPES.asset_dist_rec_type;
   l_asset_dist_tbl           FA_API_TYPES.asset_dist_tbl_type;
   l_inv_tbl                  FA_API_TYPES.inv_tbl_type;
   l_inv_rate_tbl             FA_API_TYPES.inv_rate_tbl_type;

   l_return_status            VARCHAR2(1);     
   l_mesg_count               number;
   l_mesg                     varchar2(4000);
BEGIN


   FA_SRVR_MSG.Init_Server_Message;  

   -- desc info
   l_asset_desc_rec.in_use_flag                  := 'YES';
   l_asset_desc_rec.new_used                     := 'NEW';
   l_asset_desc_rec.owned_leased                 := 'OWNED';
   l_asset_desc_rec.current_units                := 1;
   l_asset_desc_rec.description                  := 'New Fa addition';
   l_asset_desc_rec.asset_key_ccid               := 1;
/*
   --type info
   l_asset_type_rec.asset_type                   := 'CAPITALIZED';

   -- Asset Financial Information --
   l_asset_fin_rec.set_of_books_id               :=0;    
   l_asset_fin_rec.date_placed_in_service        := TO_DATE('01-DEC-2024','DD-MON-RRRR');
   l_asset_fin_rec.deprn_start_date              := TO_DATE('01-DEC-2024','DD-MON-RRRR');
   l_asset_fin_rec.deprn_method_code             := 'STL';
   l_asset_fin_rec.life_in_months                := 240;
   l_asset_fin_rec.original_cost                 := 50000;
   l_asset_fin_rec.cost                          := 50000;
   l_asset_fin_rec.prorate_convention_code       := 'SAME MONTH'; 
   l_asset_fin_rec.salvage_type                  := 'AMT'; -- PCT - for Percentage
   l_asset_fin_rec.salvage_value                 := 100;
   l_asset_fin_rec.percent_salvage_value         := NULL;
   l_asset_fin_rec.depreciate_flag               := 'YES';
   l_asset_fin_rec.orig_deprn_start_date         := TO_DATE('01-JAN-2025','DD-MON-RRRR');

   -- deprn info
   l_asset_deprn_rec.set_of_books_id             := 0;    
   l_asset_deprn_rec.ytd_deprn                   := 100;
   l_asset_deprn_rec.deprn_reserve               := 20000;
   l_asset_deprn_rec.bonus_ytd_deprn             := 0;
   l_asset_deprn_rec.bonus_deprn_reserve         := 0;

   */

   l_asset_dist_rec.units_assigned               := 1;

   l_asset_dist_rec.expense_ccid                 := 208082; 
 
   l_asset_dist_rec.location_ccid                := 11; 
   l_asset_dist_rec.assigned_to                  := NULL;
   l_asset_dist_rec.transaction_units            := l_asset_dist_rec.units_assigned;
   l_asset_dist_tbl(1)                           := l_asset_dist_rec;

  l_asset_hdr_rec.book_type_code                := 'MMG FA BOOK';
  l_asset_cat_rec.category_id                   := '7'; 

   -- call the api 
   fa_addition_pub.do_addition(
           -- std parameters
           p_api_version             => 1.0,
           p_init_msg_list           => FND_API.G_TRUE,
           p_commit                  => FND_API.G_TRUE,
           p_validation_level        => FND_API.G_VALID_LEVEL_FULL,
           p_calling_fn              => null,
           x_return_status           => l_return_status,
           x_msg_count               => l_mesg_count,
           x_msg_data                => l_mesg,
           -- api parameters
           px_trans_rec              => l_trans_rec,
           px_dist_trans_rec         => l_dist_trans_rec,
           px_asset_hdr_rec          => l_asset_hdr_rec,
           px_asset_desc_rec         => l_asset_desc_rec,
           px_asset_type_rec         => l_asset_type_rec,
           px_asset_cat_rec          => l_asset_cat_rec,
           px_asset_hierarchy_rec    => l_asset_hierarchy_rec,
           px_asset_fin_rec          => l_asset_fin_rec,
           px_asset_deprn_rec        => l_asset_deprn_rec,
           px_asset_dist_tbl         => l_asset_dist_tbl,
           px_inv_tbl                => l_inv_tbl
          );

   --dump messages
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
     dbms_output.put_line('ASSET_ID :' || to_char(l_asset_hdr_rec.asset_id));
     dbms_output.put_line('ASSET_NUMBER :' || l_asset_desc_rec.asset_number);
   end if;

end;

Select * from fa_additions_B

select * from fa_categories_b

select * from fa_asset_history

select * from fa_books 

select * from fa_category_books 

select * from fa_locations

select * from fa_deprn_summary
