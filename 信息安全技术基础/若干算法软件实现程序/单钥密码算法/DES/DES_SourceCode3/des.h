//des.hpp
//Update:2003.4.15
//LKey and RKey contain 28 bits legal key each.
//LExKey contains 16bit exchange flag.
//RExKey contains 32bit XOR data.

#pragma inline_depth(5)

void desenc(unsigned long& LData, unsigned long& RData,
			unsigned long LKey, unsigned long RKey, 
			unsigned long S_Box[512]);
void desdec(unsigned long& LData, unsigned long& RData,
			unsigned long LKey, unsigned long RKey, 
			unsigned long S_Box[512]);
void init_s_box(unsigned long LExKey,
		 	    unsigned long RExKey, 
				unsigned long S_Box[512]);
void reset_s_box(unsigned long S_Box[512]);
long isweakkey(unsigned long& LKey, unsigned long& RKey);
//compressed_key must be a array that can store 16 _int64s.
void init_enc_cmpkeys(unsigned long LKey,
					  unsigned long RKey,
					  unsigned char compressed_key[128]);
void init_dec_cmpkeys(unsigned long LKey,
					  unsigned long RKey,
					  unsigned char compressed_key[128]);
void fast_desenc(unsigned long& LData, unsigned long& RData,
				 unsigned char compressed_key[128],
				 unsigned long S_Box[512]);
void fast_desdec(unsigned long& LData, unsigned long& RData,
				 unsigned char compressed_key[128],
				 unsigned long S_Box[512]);
