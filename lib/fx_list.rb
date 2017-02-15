module FX

   class List
      
      def all
         %w(usd eur jpy gbp aud chf cad hkd sek nzd krw sgd nok mxn inr) #	can add more currencies into the array later on
      end
      
      def all_pairs
         all.combination(2).map(&:join)         
      end
      
      def all_pairs_hash
         all_pairs.each_with_object({}) do |item,object|
            object[item] = nil
         end
      end

   end

end




=begin

	all_pairs
	[
	"usdeur", "usdjpy", "usdgbp", "usdaud", "usdchf", "usdcad", "usdhkd", "usdsek", "usdnzd", "usdkrw", "usdsgd", "usdnok", "usdmxn", "usdinr", 
	"eurjpy", "eurgbp", "euraud", "eurchf", "eurcad", "eurhkd", "eursek", "eurnzd", "eurkrw", "eursgd", "eurnok", "eurmxn", "eurinr", 
	"jpygbp", "jpyaud", "jpychf", "jpycad", "jpyhkd", "jpysek", "jpynzd", "jpykrw", "jpysgd", "jpynok", "jpymxn", "jpyinr", 
	"gbpaud", "gbpchf", "gbpcad", "gbphkd", "gbpsek", "gbpnzd", "gbpkrw", "gbpsgd", "gbpnok", "gbpmxn", "gbpinr", 
	"audchf", "audcad", "audhkd", "audsek", "audnzd", "audkrw", "audsgd", "audnok", "audmxn", "audinr", 
	"chfcad", "chfhkd", "chfsek", "chfnzd", "chfkrw", "chfsgd", "chfnok", "chfmxn", "chfinr", 
	"cadhkd", "cadsek", "cadnzd", "cadkrw", "cadsgd", "cadnok", "cadmxn", "cadinr", 
	"hkdsek", "hkdnzd", "hkdkrw", "hkdsgd", "hkdnok", "hkdmxn", "hkdinr", 
	"seknzd", "sekkrw", "seksgd", "seknok", "sekmxn", "sekinr", 
	"nzdkrw", "nzdsgd", "nzdnok", "nzdmxn", "nzdinr", 
	"krwsgd", "krwnok", "krwmxn", "krwinr", 
	"sgdnok", "sgdmxn", "sgdinr", 
	"nokmxn", "nokinr", 
	"mxninr"
	] 

	all_pairs_hash
	{
	"usdeur"=>nil, "usdjpy"=>nil, "usdgbp"=>nil, "usdaud"=>nil, "usdchf"=>nil, "usdcad"=>nil, "usdhkd"=>nil, "usdsek"=>nil, "usdnzd"=>nil, "usdkrw"=>nil, "usdsgd"=>nil, "usdnok"=>nil, "usdmxn"=>nil, "usdinr"=>nil, 
	"eurjpy"=>nil, "eurgbp"=>nil, "euraud"=>nil, "eurchf"=>nil, "eurcad"=>nil, "eurhkd"=>nil, "eursek"=>nil, "eurnzd"=>nil, "eurkrw"=>nil, "eursgd"=>nil, "eurnok"=>nil, "eurmxn"=>nil, "eurinr"=>nil, 
	"jpygbp"=>nil, "jpyaud"=>nil, "jpychf"=>nil, "jpycad"=>nil, "jpyhkd"=>nil, "jpysek"=>nil, "jpynzd"=>nil, "jpykrw"=>nil, "jpysgd"=>nil, "jpynok"=>nil, "jpymxn"=>nil, "jpyinr"=>nil, 
	"gbpaud"=>nil, "gbpchf"=>nil, "gbpcad"=>nil, "gbphkd"=>nil, "gbpsek"=>nil, "gbpnzd"=>nil, "gbpkrw"=>nil, "gbpsgd"=>nil, "gbpnok"=>nil, "gbpmxn"=>nil, "gbpinr"=>nil, 
	"audchf"=>nil, "audcad"=>nil, "audhkd"=>nil, "audsek"=>nil, "audnzd"=>nil, "audkrw"=>nil, "audsgd"=>nil, "audnok"=>nil, "audmxn"=>nil, "audinr"=>nil, 
	"chfcad"=>nil, "chfhkd"=>nil, "chfsek"=>nil, "chfnzd"=>nil, "chfkrw"=>nil, "chfsgd"=>nil, "chfnok"=>nil, "chfmxn"=>nil, "chfinr"=>nil, 
	"cadhkd"=>nil, "cadsek"=>nil, "cadnzd"=>nil, "cadkrw"=>nil, "cadsgd"=>nil, "cadnok"=>nil, "cadmxn"=>nil, "cadinr"=>nil, 
	"hkdsek"=>nil, "hkdnzd"=>nil, "hkdkrw"=>nil, "hkdsgd"=>nil, "hkdnok"=>nil, "hkdmxn"=>nil, "hkdinr"=>nil, 
	"seknzd"=>nil, "sekkrw"=>nil, "seksgd"=>nil, "seknok"=>nil, "sekmxn"=>nil, "sekinr"=>nil, 
	"nzdkrw"=>nil, "nzdsgd"=>nil, "nzdnok"=>nil, "nzdmxn"=>nil, "nzdinr"=>nil, 
	"krwsgd"=>nil, "krwnok"=>nil, "krwmxn"=>nil, "krwinr"=>nil, 
	"sgdnok"=>nil, "sgdmxn"=>nil, "sgdinr"=>nil, 
	"nokmxn"=>nil, "nokinr"=>nil, 
	"mxninr"=>nil
	}

=end