# coding: utf-8
require 'json'

Tweet = Struct.new(:text, :time, :lang, :source, :user_name, :user_img, :user_url) do
  def time_phrase
    now                = Time.now.to_i
    posted             = self.time
    seconds            = now - posted.round
    approx_sec_by_five = (seconds / 5.0).round * 5
    approx_min         = (seconds / 60.0).round
    approx_min_by_five = (seconds / 300.0).round * 5
    range = {
      just_now:     0..4,
      seconds:      5..34,
      minutes:      35..249,
      five_minutes: 250..600
    }

    case seconds
    when range[:just_now]
      "just now"
    when range[:seconds]
      "about #{approx_sec_by_five}sec ago"
    when range[:minutes]
      "about #{approx_min}min ago"
    when range[:five_minutes]
      "about #{approx_min_by_five}min ago"
    else
      "recently"
    end
  end
end

def tweets
  out = []
  TweetData.each do |t|
    out << Tweet.new(
      t["data"]["text"],
      Time.new.to_i - (rand() * 600),
      t["data"]["lang"],
      t["data"]["source"],
      t["includes"]["users"][0]["username"],
      t["includes"]["users"][0]["profile_image_url"],
      t["includes"]["users"][0]["url"]
    )
  end
  out
end


def get_feed
  tweets.shuffle[1..20]
    .sort_by { |t| t.time }
    .reverse
end

def get_feed_json
  get_feed
    .map { |t| t.to_h.to_json }
    .to_json
end

# real twitter data obtained via curl

TweetData = JSON.parse('[{"data":{"lang":"ko","source":"TweetDeck","created_at":"2021-03-25T16:24:07.000Z","author_id":"904091024800210944","id":"1375121327527354373","text":"ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ큐ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ아니 진짜 묵묵하게 아이스크림을 잘 먹는 모습 너무 귀엽잖아욬ㅋㅋㅋㅋㅋㅋㅋ큐ㅠㅠㅠㅠ https://t.co/yc5Z0E0uFl"},"includes":{"users":[{"name":"보즈야냠냠이도트","profile_image_url":"https://pbs.twimg.com/profile_images/1312069120758702080/Z043DC0s_normal.jpg","id":"904091024800210944","username":"Dot_ff14","url":""}]}},
{"data":{"lang":"in","source":"Twitter for Android","created_at":"2021-03-25T16:24:07.000Z","author_id":"248277012","id":"1375121327527366660","text":"RT @savageflippermo: #ShehnaazGill k fan boys k dukhde \n\n😂😂😂😂😂"},"includes":{"users":[{"name":"Peace/Team Shehnaaz","profile_image_url":"https://pbs.twimg.com/profile_images/1357980851888287746/5So-fYG2_normal.jpg","id":"248277012","username":"rashdag","url":""}]}},
{"data":{"lang":"en","source":"Twitter for iPhone","created_at":"2021-03-25T16:24:07.000Z","author_id":"29993996","id":"1375121327556685824","text":"@SharonKerechan1 @VP How about just giving violent criminals the death penalty instead of putting them back on the streets. That might slow the tide of violence."},"includes":{"users":[{"name":"Kelly Landon","profile_image_url":"https://pbs.twimg.com/profile_images/3785897794/8ddeaf18e7e14e1ca44e73485e30198e_normal.jpeg","id":"29993996","username":"glamisgal","url":""}]}},
{"data":{"lang":"ja","source":"グランブルー ファンタジー","created_at":"2021-03-25T16:24:07.000Z","author_id":"840273521565552640","id":"1375121327535783944","text":"スマホRPGは今これをやってるよ。今の推しキャラはこちら！ https://t.co/uFhcufXG36"},"includes":{"users":[{"name":"gbl","profile_image_url":"https://pbs.twimg.com/profile_images/850428362862415872/G82jggeV_normal.jpg","id":"840273521565552640","username":"box_____up","url":""}]}},
{"data":{"lang":"ar","source":"Twitter for Android","created_at":"2021-03-25T16:24:08.000Z","author_id":"979687694468042752","id":"1375121331734335494","text":"RT @_Du3aa24: اللهم لاتفجعني في نفسي ، ولاتفجعني في أهلي جعلتهم دائماً في ودائِعك✨"},"includes":{"users":[{"name":"ℝ𝔸ℕ𝔸","profile_image_url":"https://pbs.twimg.com/profile_images/1294032502835695616/TXT13q4g_normal.jpg","id":"979687694468042752","username":"Rano55551","url":""}]}},
{"data":{"lang":"und","source":"Twitter for Android","created_at":"2021-03-25T16:24:08.000Z","author_id":"1320066527392129025","id":"1375121331725987846","text":"@adoreedino"},"includes":{"users":[{"name":"ju love acc ♡","profile_image_url":"https://pbs.twimg.com/profile_images/1375101897770696714/qeVXRjdh_normal.jpg","id":"1320066527392129025","username":"inyu6ix","url":"https://t.co/kZO2gj9RcK"}]}},
{"data":{"lang":"tr","source":"Twitter for iPhone","created_at":"2021-03-25T16:24:08.000Z","author_id":"830159224479047680","id":"1375121331725987845","text":"RT @avkarci: Cezaevinden arandım. Tanımadığım bir hükmlü şahıs dedi ki; “avukt hanım şu şu dosyalarım var. Bir de eşimi dövdüğüm için 5 ay…"},"includes":{"users":[{"name":"Begüm Güleryüz","profile_image_url":"https://pbs.twimg.com/profile_images/1288408725712240640/Fzsh6EG-_normal.jpg","id":"830159224479047680","username":"begum_guleryuz","url":""}]}},
{"data":{"lang":"tr","source":"Twitter for iPhone","created_at":"2021-03-25T16:24:08.000Z","author_id":"1243569743170240514","id":"1375121331734376452","text":"RT @wonderkidwin: bir kulübün yedi aylık sportif direktörü, geçen sezonun futbolcusu, hayatında hiç teknik direktörlük yapmamış ismi, son o…"},"includes":{"users":[{"name":"Tilki","profile_image_url":"https://pbs.twimg.com/profile_images/1326257287112122370/BINOWj40_normal.jpg","id":"1243569743170240514","username":"tilkiandrei1907","url":""}]}},
{"data":{"lang":"es","source":"Twitter for iPhone","created_at":"2021-03-25T16:24:08.000Z","author_id":"1214369197771411457","id":"1375121331738513409","text":"@laximeyya Yo se, esos guionistas si cero visión :)"},"includes":{"users":[{"name":"Marielos","profile_image_url":"https://pbs.twimg.com/profile_images/1365825176215117824/jRoegOXS_normal.jpg","id":"1214369197771411457","username":"marielosflores_","url":""}]}},
{"data":{"lang":"pt","source":"Twitter Web App","created_at":"2021-03-25T16:24:08.000Z","author_id":"941855739043373056","id":"1375121331755356161","text":"nao perai como assim ela tem musica com a HATSUNE MIKU"},"includes":{"users":[{"name":"du","profile_image_url":"https://pbs.twimg.com/profile_images/1374756368511594498/ax5dpl80_normal.jpg","id":"941855739043373056","username":"hollowarda","url":"https://t.co/JojeFohIvg"}]}},
{"data":{"lang":"tr","source":"Twitter Web App","created_at":"2021-03-25T16:24:08.000Z","author_id":"1281459305020043265","id":"1375121331726004224","text":"RT @ElazigPalu23: Karamollaoğlu  Cumhur İttifakına yeşil ışık yaktı ,yorumları alalım.🤔"},"includes":{"users":[{"name":"🇹🇷 Dayılar Meclisi 🇹🇷","profile_image_url":"https://pbs.twimg.com/profile_images/1282898788303216643/5YL6E8WL_normal.jpg","id":"1281459305020043265","username":"dds_by","url":""}]}},
{"data":{"lang":"es","source":"Twitter for Android","created_at":"2021-03-25T16:24:08.000Z","author_id":"1346839032735653889","id":"1375121331738587137","text":"RT @CValenzuelaxxx: Este video completo está disponible en mi único onlyfans. \n Ve y mira ahora👈\n50% de descuento ☑️\nSolo 3.75$☑️\nSuscríbet…"},"includes":{"users":[{"name":"jesus alberto ponce chavez","profile_image_url":"https://pbs.twimg.com/profile_images/1346840596258893824/aMDwCcwy_normal.jpg","id":"1346839032735653889","username":"jesusal98225205","url":""}]}},
{"data":{"lang":"es","source":"Twitter for Android","created_at":"2021-03-25T16:24:08.000Z","author_id":"2400008484","id":"1375121331717554183","text":"@guelcalas @ElHuffPost Coño, y vamos a ser serios, porque son peores."},"includes":{"users":[{"name":"Carlos A. Paniagua","profile_image_url":"https://pbs.twimg.com/profile_images/461819232096108544/BZDPJLBV_normal.jpeg","id":"2400008484","username":"Carlos_pancab","url":""}]}},
{"data":{"lang":"ja","source":"Twitter for Android","created_at":"2021-03-25T16:24:08.000Z","author_id":"817639830859485184","id":"1375121331725959172","text":"RT @wyenra_kilala: 髪がだいぶ伸びてきたようです https://t.co/M2zoKq8jcw"},"includes":{"users":[{"name":"Егор Мирный","profile_image_url":"https://pbs.twimg.com/profile_images/1107866251030876161/SivH4Nuc_normal.png","id":"817639830859485184","username":"egor_mirniy","url":""}]}},
{"data":{"lang":"en","source":"Twitter for iPhone","created_at":"2021-03-25T16:24:08.000Z","author_id":"1159919190435860480","id":"1375121331746959364","text":"RT @scretladyspider: “Asexuality is heteronormative” not sure what society you’re living in but I assure you it’s not"},"includes":{"users":[{"name":"Golf Echo Romeo Tango India (they/xe)","profile_image_url":"https://pbs.twimg.com/profile_images/1344488521973829632/1la__C9l_normal.jpg","id":"1159919190435860480","username":"xebrew","url":""}]}},
{"data":{"lang":"ru","source":"Twitter Web App","created_at":"2021-03-25T16:24:08.000Z","author_id":"323362639","id":"1375121331751124993","text":"@belteanews Ждут балет Лебединое озеро"},"includes":{"users":[{"name":"Inna Grinchik","profile_image_url":"https://pbs.twimg.com/profile_images/1310705398463291392/zm-1zX-e_normal.jpg","id":"323362639","username":"innagrinchik","url":""}]}},
{"data":{"lang":"ja","source":"Twitter for Android","created_at":"2021-03-25T16:24:08.000Z","author_id":"966524183789350912","id":"1375121331717603334","text":"RT @nonoworks: 寝る前に落書き🌸 https://t.co/lzcR6N327r"},"includes":{"users":[{"name":"Charlotte Toadstool 🏳️‍⚧️","profile_image_url":"https://pbs.twimg.com/profile_images/1374319710456705027/fKXFGntL_normal.jpg","id":"966524183789350912","username":"cozy_charlotte","url":"https://t.co/gqhACteq0w"}]}},
{"data":{"lang":"ar","source":"Twitter for Android","created_at":"2021-03-25T16:24:08.000Z","author_id":"782234070117998592","id":"1375121331717603330","text":"RT @moe_gov_sa: #وزير_التعليم⁩ يلتقي عن بُعد بالمبعوث الخاص لرئيس الوزراء البريطاني للتعليم د.السير ستيف سميث، ويبحث معه مجالات التعاون الع…"},"includes":{"users":[{"name":"المدرسة الخامسة لتحفيظ القرآن الابتدائية","profile_image_url":"https://pbs.twimg.com/profile_images/1330841120633401345/uann0EqU_normal.jpg","id":"782234070117998592","username":"MOE_JDH_20_1038","url":""}]}},
{"data":{"lang":"und","source":"Twitter for iPhone","created_at":"2021-03-25T16:24:08.000Z","author_id":"959302998336856065","id":"1375121331730182144","text":"RT @FentyFlora: Now @Rihanna https://t.co/2yijYPqylP"},"includes":{"users":[{"name":"Honey🍄☘️","profile_image_url":"https://pbs.twimg.com/profile_images/1364334725951856644/UgbmnQre_normal.jpg","id":"959302998336856065","username":"ChristineNinti","url":""}]}},
{"data":{"lang":"en","source":"Twitter Web App","created_at":"2021-03-25T16:24:08.000Z","author_id":"1371507597443006470","id":"1375121331730141190","text":"@rbird5541 Thank you"},"includes":{"users":[{"name":"Proud Va Patriot","profile_image_url":"https://pbs.twimg.com/profile_images/1371508137786740737/qpw5wlmA_normal.jpg","id":"1371507597443006470","username":"proudVaPatriot","url":""}]}},
{"data":{"lang":"tl","source":"Twitter for Android","created_at":"2021-03-25T16:24:08.000Z","author_id":"287494139","id":"1375121331725893635","text":"@mardevvv couo yang mana nie"},"includes":{"users":[{"name":"nyt.彡❁ 📌love or take 💙","profile_image_url":"https://pbs.twimg.com/profile_images/1373933556553056262/jvrcYzcD_normal.jpg","id":"287494139","username":"miyawakianity","url":"https://t.co/9XujpzjSeL"}]}},
{"data":{"lang":"de","source":"Twitter Web App","created_at":"2021-03-25T16:24:08.000Z","author_id":"1346113812856975361","id":"1375121331717570568","text":"@HB_Demoticker Wenn es wenigstens auch Echter-Lockdown-Modellregionen geben würde ..."},"includes":{"users":[{"name":"Birgit 🐞 🎶 ☕","profile_image_url":"https://pbs.twimg.com/profile_images/1355895753164599297/guz90JCt_normal.jpg","id":"1346113812856975361","username":"kernoktave","url":""}]}},
{"data":{"lang":"ar","source":"Twitter for Android","created_at":"2021-03-25T16:24:08.000Z","author_id":"1305474771161935873","id":"1375121331721748481","text":"RT @6lHll: ⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀ ⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀ ⠀⠀⠀⠀ ⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀\nأحب كونك الوحيد…"},"includes":{"users":[{"name":"٥٧","profile_image_url":"https://pbs.twimg.com/profile_images/1366218098324492291/a_VG7iIL_normal.jpg","id":"1305474771161935873","username":"vldfb","url":""}]}},
{"data":{"lang":"th","source":"Twitter for iPhone","created_at":"2021-03-25T16:24:08.000Z","author_id":"1258019412017246209","id":"1375121331730051084","text":"RT @punch_ks: กวนละ1😂😂 https://t.co/1HYwFTnGbh"},"includes":{"users":[{"name":"brightWin","profile_image_url":"https://pbs.twimg.com/profile_images/1322860699480043520/yOFt8C8E_normal.jpg","id":"1258019412017246209","username":"_GuessBW","url":""}]}},
{"data":{"lang":"en","source":"Twitter for Android","created_at":"2021-03-25T16:24:08.000Z","author_id":"904292387949649920","id":"1375121331725889540","text":"#EbarBJP \n\nBJP will win Bengal and Assam with full majority .....✌️✌️✌️✌️\n\n#JaiShreeRam"},"includes":{"users":[{"name":"SoloBolo","profile_image_url":"https://pbs.twimg.com/profile_images/1317885000566464514/k1QBLaLh_normal.jpg","id":"904292387949649920","username":"SoloBoloVlog","url":"https://t.co/yhO09OTvLd"}]}},
{"data":{"lang":"ja","source":"Twitter for iPhone","created_at":"2021-03-25T16:24:08.000Z","author_id":"1297023243031732226","id":"1375121331738447873","text":"@ryuu_2224 はいはいはーい！\nごじらがあまってます！"},"includes":{"users":[{"name":"お暇なひつまぶし","profile_image_url":"https://pbs.twimg.com/profile_images/1372714330135822337/ky4KX9DE_normal.jpg","id":"1297023243031732226","username":"hityumabuti","url":""}]}},
{"data":{"lang":"en","source":"Twitter for iPhone","created_at":"2021-03-25T16:24:08.000Z","author_id":"1177538896298676224","id":"1375121331755364361","text":"Really? https://t.co/lgjIcpVIxd"},"includes":{"users":[{"name":"Brian Gibbons","profile_image_url":"https://pbs.twimg.com/profile_images/1245014745415127044/uY9AOW2G_normal.jpg","id":"1177538896298676224","username":"BrianGi77684682","url":""}]}},
{"data":{"lang":"ja","source":"Twitter Web App","created_at":"2021-03-25T16:24:08.000Z","author_id":"267567286","id":"1375121331751067651","text":"ずっと聴いてる… Luke Temple / Empty Promises https://t.co/2d3xFsdwP0"},"includes":{"users":[{"name":"篠篠篠篠篠篠","profile_image_url":"https://pbs.twimg.com/profile_images/502390973448466433/0uDcrOvA_normal.jpeg","id":"267567286","username":"K_local_music","url":""}]}},
{"data":{"lang":"en","source":"Twitter for iPhone","created_at":"2021-03-25T16:24:08.000Z","author_id":"28286550","id":"1375121331742781449","text":"RT @WaveGodTeej: This is what a Bitch looks like.... don’t be like this guy please. https://t.co/NDdkbqyDSp"},"includes":{"users":[{"name":"rico winston","profile_image_url":"https://pbs.twimg.com/profile_images/1278741643613487106/rjYXlZN0_normal.jpg","id":"28286550","username":"ReekHavoc22","url":""}]}},
{"data":{"lang":"ko","source":"Twitter for iPhone","created_at":"2021-03-25T16:24:08.000Z","author_id":"1298225361851801600","id":"1375121331730096128","text":"RT @soon_twit: 장항준처럼 살고 싶다... 찾고 있어 나의 김은희.......어딨는거야..."},"includes":{"users":[{"name":"Prfbr","profile_image_url":"https://pbs.twimg.com/profile_images/1298227047899095040/KqRxCPfn_normal.jpg","id":"1298225361851801600","username":"Prfbr1","url":""}]}},
{"data":{"lang":"en","source":"Twitter for iPhone","created_at":"2021-03-25T16:24:08.000Z","author_id":"2171319884","id":"1375121331755180037","text":"align to destroy"},"includes":{"users":[{"name":"ki🥇","profile_image_url":"https://pbs.twimg.com/profile_images/1374243698167324672/0DNA2sv7_normal.jpg","id":"2171319884","username":"kianaalunaa","url":""}]}},
{"data":{"lang":"in","source":"Twitter for iPhone","created_at":"2021-03-25T16:24:08.000Z","author_id":"1198263313206956032","id":"1375121331746787328","text":"RT @pedoqpop: Terbaik Anita sarawak. Otai masih berbisa"},"includes":{"users":[{"name":"qis","profile_image_url":"https://pbs.twimg.com/profile_images/1366486237205331968/XN37skZu_normal.jpg","id":"1198263313206956032","username":"qistinazhn","url":""}]}},
{"data":{"lang":"th","source":"Twitter for iPhone","created_at":"2021-03-25T16:24:08.000Z","author_id":"173790744","id":"1375121331721695240","text":"RT @jalejeno_o: อีสัด55555555ว่ายน้ำเป็นก็ต้องสวมเสื้อชูชีพค่ะอีควาย https://t.co/4KS6PSv06h"},"includes":{"users":[{"name":"cafuné","profile_image_url":"https://pbs.twimg.com/profile_images/1364497382444965888/AkrcqDJ6_normal.jpg","id":"173790744","username":"filltaa","url":"https://t.co/FonV9BnwXr"}]}},
{"data":{"lang":"th","source":"Twitter Web App","created_at":"2021-03-25T16:24:08.000Z","author_id":"1180490442200076289","id":"1375121331750985730","text":"RT @niira_sup: พอรู้แหละ ว่าเซ้นต์จูบเก่งมากๆๆ แต่อันนี้ โอ้วววโห้ววววว พิ้อุ๋งงง!!~ มึงงงทำไมกุเขิงงงง\nช่วยกูด้วยยยยย กุตายยยแล้ววววว༎ຶ‿༎ຶ…"},"includes":{"users":[{"name":"ทวิตคือของส่วนตัว","profile_image_url":"https://pbs.twimg.com/profile_images/1349354723258765312/BLbqcua2_normal.jpg","id":"1180490442200076289","username":"MaPrawkongKaew","url":""}]}},
{"data":{"lang":"pt","source":"Twitter Web App","created_at":"2021-03-25T16:24:08.000Z","author_id":"1082627364574646272","id":"1375121331755356160","text":"Então antes estava ainda no limite do bom senso? https://t.co/F75LsSqIRY"},"includes":{"users":[{"name":"PiuPiu Monstro da Pandemia 💉🔬☣🇧🇷🇦🇷🌱","profile_image_url":"https://pbs.twimg.com/profile_images/1346813029355302913/l15LIdtE_normal.jpg","id":"1082627364574646272","username":"PiuPiuMalvado","url":""}]}},
{"data":{"lang":"ko","source":"Twitter for Android","created_at":"2021-03-25T16:24:08.000Z","author_id":"1557015350","id":"1375121331738406919","text":"RT @myloverxiu: #RT\n🦋 𝐇𝐚𝐩𝐩𝐲𝐱𝐢𝐮𝐦𝐢𝐧𝐝𝐚𝐲🦋\n시우민 생일 및 슈윗타임 기념 RT이벤트 진행합니다.\n\n한 분에게 에어팟 프로, 한 분에게는 디올 립글로우 총 2분께 드릴게요~ ₍˄·͈༝·͈˄₎◞ ̑̑ෆ⃛❄️\n국내 주소 필수 ⭕️…"},"includes":{"users":[{"name":"❄️쓸❄️","profile_image_url":"https://pbs.twimg.com/profile_images/1370731836758843395/9mZvDpnT_normal.png","id":"1557015350","username":"Elsa_sseul","url":"https://t.co/xylwYZjXBz"}]}},
{"data":{"lang":"ja","source":"Twitter for Android","created_at":"2021-03-25T16:24:08.000Z","author_id":"1361981384370266120","id":"1375121331755216898","text":"顔と首で54,000円を最低でも5回だからトータル30万くらいだね"},"includes":{"users":[{"name":"なっち@青髪の一味","profile_image_url":"https://pbs.twimg.com/profile_images/1373338031202045952/HFqEebU3_normal.jpg","id":"1361981384370266120","username":"wYmtUp27mvuJSGS","url":""}]}},
{"data":{"lang":"ja","source":"Twitter for iPhone","created_at":"2021-03-25T16:24:08.000Z","author_id":"1373203984211615746","id":"1375121331717513217","text":"@RPl1Ov5X3io5133 うあ！幼女戦記だ!!"},"includes":{"users":[{"name":"りあ。","profile_image_url":"https://pbs.twimg.com/profile_images/1374000936046055424/kjTKTiId_normal.jpg","id":"1373203984211615746","username":"Aim_riA","url":""}]}},
{"data":{"lang":"und","source":"Twitter for iPhone","created_at":"2021-03-25T16:24:08.000Z","author_id":"1087223815073976320","id":"1375121331751030787","text":"RT @euphoria_lancyy: https://t.co/HMYS4OCtDb"},"includes":{"users":[{"name":"Michigeseo","profile_image_url":"https://pbs.twimg.com/profile_images/1105450631622324224/TO8Hefvd_normal.jpg","id":"1087223815073976320","username":"michigeseo05","url":""}]}},
{"data":{"lang":"en","source":"Twitter for Android","created_at":"2021-03-25T16:24:08.000Z","author_id":"709384613332787200","id":"1375121331730046980","text":"RT @iniyumefess: 『\n        ✾𝙒𝙚𝙡𝙘𝙤𝙢𝙚 𝙩𝙤𝙔𝙪𝙢𝙚𝙛𝙚𝙨𝙨 ✾\n                                                        』 https://t.co/SEGGiDWNfF"},"includes":{"users":[{"name":"RYSZARD","profile_image_url":"https://pbs.twimg.com/profile_images/1371398550639104001/2LwSa-1z_normal.jpg","id":"709384613332787200","username":"ChandraRyszard","url":""}]}},
{"data":{"lang":"ja","source":"グランブルー ファンタジー","created_at":"2021-03-25T16:24:08.000Z","author_id":"1149693020","id":"1375121331755212801","text":"新品 4081774D :参戦ID\n参加者募集！\nLv120 カー・オン\nhttps://t.co/4xFoyIAeOa"},"includes":{"users":[{"name":"もい","profile_image_url":"https://abs.twimg.com/sticky/default_profile_images/default_profile_normal.png","id":"1149693020","username":"moidesu13","url":""}]}}]')
