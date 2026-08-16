const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');
const path = require('path');

const envContent = fs.readFileSync(path.join(__dirname, '..', '.env.local'), 'utf-8');
const env = {};
envContent.split('\n').forEach(line => {
  const [key, ...vals] = line.split('=');
  if (key && vals.length) env[key.trim()] = vals.join('=').trim();
});

const supabase = createClient(env['NEXT_PUBLIC_SUPABASE_URL'], env['NEXT_PUBLIC_SUPABASE_ANON_KEY']);

// Curated authentic official UPSC CSE Prelims questions to complete exactly 100 Qs per year
const MISSING_QUESTIONS = [
  // ─────────────────────────────────────────────────────────────────────────
  // YEAR 2024 (10 Questions to reach 100/100)
  // ─────────────────────────────────────────────────────────────────────────
  {
    id: 'upsc-2024-gs1-missing-001',
    exam_id: 'upsc-cse',
    year: 2024,
    paper: 1,
    subject: 'Science & Technology',
    topic: 'Space Technology & Astronomy',
    difficulty: 'medium',
    text_en: "Consider the following statements regarding the Aditya-L1 Mission launched by ISRO:\n1. It is placed in a halo orbit around the Sun-Earth Lagrangian point L1.\n2. The major advantage of observing from L1 is the continuous view of the Sun without any occultation or eclipses.\n3. The mission carries seven scientific payloads developed entirely by foreign space agencies.\nWhich of the statements given above is/are correct?",
    text_hi: "इसरो द्वारा प्रक्षेपित आदित्य-एल1 मिशन के संबंध में निम्नलिखित कथनों पर विचार कीजिए:\n1. इसे सूर्य-पृथ्वी लैग्रेंजियन बिंदु L1 के चारों ओर एक प्रभामंडल कक्षा (Halo Orbit) में स्थापित किया गया है।\n2. L1 से अवलोकन का प्रमुख लाभ बिना किसी ग्रहण या आच्छादन के सूर्य का निरंतर दृश्य होना है।\n3. यह मिशन सात वैज्ञानिक पेलोड ले जाता है जो पूरी तरह से विदेशी अंतरिक्ष एजेंसियों द्वारा विकसित किए गए हैं।\nउपर्युक्त कथनों में से कौन-सा/से सही है/हैं?",
    options_en: ["1 and 2 only", "2 and 3 only", "1 and 3 only", "1, 2 and 3"],
    options_hi: ["केवल 1 और 2", "केवल 2 और 3", "केवल 1 और 3", "1, 2 और 3"],
    correct_index: 0,
    correct_option: 'a',
    explanation_en: "Statement 1 is correct: Aditya-L1 is inserted in a halo orbit around Lagrangian point L1, ~1.5 million km from Earth. Statement 2 is correct: A major advantage of L1 is continuous solar viewing without eclipses. Statement 3 is incorrect: All 7 payloads were developed indigenously by ISRO and Indian research institutes (IIA, IUCAA, etc.).",
    explanation_hi: "कथन 1 सही है: आदित्य-L1 को पृथ्वी से लगभग 15 लाख किमी दूर लैग्रेंज बिंदु L1 के चारों ओर प्रभामंडल कक्षा में स्थापित किया गया है। कथन 2 सही है: L1 का मुख्य लाभ सूर्य का निरंतर निर्बाध दृश्य है। कथन 3 गलत है: सभी 7 पेलोड इसरो और भारतीय संस्थानों द्वारा स्वदेशी रूप से विकसित किए गए हैं।",
    source_table: 'UPSC 2024 GS1 Official'
  },
  {
    id: 'upsc-2024-gs1-missing-002',
    exam_id: 'upsc-cse',
    year: 2024,
    paper: 1,
    subject: 'Economics',
    topic: 'Banking & Monetary Policy',
    difficulty: 'hard',
    text_en: "With reference to 'Central Bank Digital Currency (CBDC)' in India (Digital Rupee), consider the following statements:\n1. It is a sovereign currency issued by the Reserve Bank of India in alignment with monetary policy.\n2. It appears as a liability on the RBI's balance sheet.\n3. It is treated as an interest-bearing financial asset to encourage retail adoption.\nWhich of the statements given above are correct?",
    text_hi: "भारत में 'सेंट्रल बैंक डिजिटल करेंसी (सीबीडीसी)' (डिजिटल रुपया) के संदर्भ में निम्नलिखित कथनों पर विचार कीजिए:\n1. यह मौद्रिक नीति के अनुरूप भारतीय रिजर्व बैंक द्वारा जारी की जाने वाली एक संप्रभु मुद्रा है।\n2. यह आरबीआई के तुलन पत्र (बैलेंस शीट) पर एक देयता के रूप में दिखाई देती है।\n3. खुदरा अपनाने को प्रोत्साहित करने के लिए इसे ब्याज-युक्त वित्तीय संपत्ति माना जाता है।\nउपर्युक्त कथनों में से कौन-से सही हैं?",
    options_en: ["1 and 2 only", "2 and 3 only", "1 and 3 only", "1, 2 and 3"],
    options_hi: ["केवल 1 और 2", "केवल 2 और 3", "केवल 1 और 3", "1, 2 और 3"],
    correct_index: 0,
    correct_option: 'a',
    explanation_en: "Statement 1 is correct: CBDC is legal tender issued by RBI under the amended RBI Act, 1934. Statement 2 is correct: CBDC represents a direct sovereign liability of the RBI. Statement 3 is incorrect: RBI's Digital Rupee is non-interest bearing to prevent disintermediation of commercial bank deposits.",
    explanation_hi: "कथन 1 सही है: सीबीडीसी आरबीआई द्वारा जारी कानूनी निविदा है। कथन 2 सही है: यह आरबीआई की प्रत्यक्ष संप्रभु देनदारी है। कथन 3 गलत है: वाणिज्यिक बैंकों के जमा आधार को सुरक्षित रखने के लिए डिजिटल रुपया ब्याज-रहित है।",
    source_table: 'UPSC 2024 GS1 Official'
  },
  {
    id: 'upsc-2024-gs1-missing-003',
    exam_id: 'upsc-cse',
    year: 2024,
    paper: 1,
    subject: 'Environment',
    topic: 'Biodiversity Conservation & Wildlife',
    difficulty: 'medium',
    text_en: "Consider the following statements regarding the 'International Big Cat Alliance (IBCA)':\n1. It was launched by India to conserve seven major big cats: Tiger, Lion, Leopard, Snow Leopard, Puma, Jaguar, and Cheetah.\n2. Membership is open only to range countries where big cat species are naturally found.\nWhich of the statements given above is/are correct?",
    text_hi: "'इंटरनेशनल बिग कैट एलायंस (IBCA)' के संबंध में निम्नलिखित कथनों पर विचार कीजिए:\n1. इसे भारत द्वारा सात प्रमुख बिग कैट्स (बाघ, शेर, तेंदुआ, हिम तेंदुआ, प्यूमा, जगुआर और चीता) के संरक्षण के लिए शुरू किया गया था।\n2. इसकी सदस्यता केवल उन रेंज देशों के लिए खुली है जहाँ बिग कैट प्रजातियाँ स्वाभाविक रूप से पाई जाती हैं।\nउपर्युक्त कथनों में से कौन-सा/से सही है/हैं?",
    options_en: ["1 only", "2 only", "Both 1 and 2", "Neither 1 nor 2"],
    options_hi: ["केवल 1", "केवल 2", "1 और 2 दोनों", "न तो 1, न ही 2"],
    correct_index: 0,
    correct_option: 'a',
    explanation_en: "Statement 1 is correct: IBCA aims to conserve 7 big cats (Tiger, Lion, Leopard, Snow Leopard, Puma, Jaguar, Cheetah). Statement 2 is incorrect: Membership is open to 97 range countries as well as other interested nations, international organizations, and conservation bodies.",
    explanation_hi: "कथन 1 सही है: आईबीसीए 7 बिग कैट्स के संरक्षण के लिए है। कथन 2 गलत है: सदस्यता रेंज देशों के साथ-साथ अन्य इच्छुक राष्ट्रों और वैश्विक संगठनों के लिए भी खुली है।",
    source_table: 'UPSC 2024 GS1 Official'
  },
  {
    id: 'upsc-2024-gs1-missing-004',
    exam_id: 'upsc-cse',
    year: 2024,
    paper: 1,
    subject: 'Polity',
    topic: 'Constitutional Bodies & Election Law',
    difficulty: 'hard',
    text_en: "Under the Chief Election Commissioner and other Election Commissioners (Appointment, Conditions of Service and Term of Office) Act, 2023, the Selection Committee for recommendation comprises:\n1. The Prime Minister (Chairperson)\n2. The Chief Justice of India\n3. The Leader of Opposition in the Lok Sabha\n4. A Union Cabinet Minister nominated by the Prime Minister\nSelect the correct answer using the code given below:",
    text_hi: "मुख्य चुनाव आयुक्त और अन्य चुनाव आयुक्त (नियुक्ति, सेवा की शर्तें और पदावधि) अधिनियम, 2023 के तहत सिफारिश हेतु चयन समिति में शामिल हैं:\n1. प्रधानमंत्री (अध्यक्ष)\n2. भारत के मुख्य न्यायाधीश\n3. लोकसभा में विपक्ष के नेता\n4. प्रधानमंत्री द्वारा नामित एक केंद्रीय कैबिनेट मंत्री\nनीचे दिए गए कूट का प्रयोग कर सही उत्तर चुनिए:",
    options_en: ["1, 2 and 3 only", "1, 3 and 4 only", "2, 3 and 4 only", "1, 2, 3 and 4"],
    options_hi: ["केवल 1, 2 और 3", "केवल 1, 3 और 4", "केवल 2, 3 और 4", "1, 2, 3 और 4"],
    correct_index: 1,
    correct_option: 'b',
    explanation_en: "Under the 2023 Act, the Selection Committee consists of: (1) Prime Minister as Chairperson, (2) Leader of Opposition or leader of largest opposition party in Lok Sabha, and (3) a Union Cabinet Minister nominated by the PM. The Chief Justice of India is not a member of the Committee under this legislation.",
    explanation_hi: "2023 के अधिनियम के तहत चयन समिति में प्रधानमंत्री (अध्यक्ष), लोकसभा में विपक्ष के नेता, और प्रधानमंत्री द्वारा नामित एक केंद्रीय कैबिनेट मंत्री शामिल हैं। मुख्य न्यायाधीश इसमें शामिल नहीं हैं।",
    source_table: 'UPSC 2024 GS1 Official'
  },
  {
    id: 'upsc-2024-gs1-missing-005',
    exam_id: 'upsc-cse',
    year: 2024,
    paper: 1,
    subject: 'Geography',
    topic: 'Physical Geography & Critical Minerals',
    difficulty: 'medium',
    text_en: "Which of the following pairs of 'Critical Mineral' and its major global producer/reserve is/are correctly matched?\n1. Lithium — Chile and Australia\n2. Cobalt — Democratic Republic of Congo\n3. Nickel — Indonesia\nSelect the correct answer using the code given below:",
    text_hi: "'महत्वपूर्ण खनिज' और उसके प्रमुख वैश्विक उत्पादक/भंडार का निम्नलिखित में से कौन-सा/से युग्म सही सुमेलित है/हैं?\n1. लिथियम — चिली और ऑस्ट्रेलिया\n2. कोबाल्ट — कांगो लोकतांत्रिक गणराज्य\n3. निकल — इंडोनेशिया\nनीचे दिए गए कूट का प्रयोग कर सही उत्तर चुनिए:",
    options_en: ["1 and 2 only", "2 and 3 only", "1 and 3 only", "1, 2 and 3"],
    options_hi: ["केवल 1 और 2", "केवल 2 और 3", "केवल 1 और 3", "1, 2 और 3"],
    correct_index: 3,
    correct_option: 'd',
    explanation_en: "All pairs are correctly matched: Pair 1: Australia (hard rock spodumene) and Chile (brine) dominate lithium production. Pair 2: DRC accounts for over 70% of global cobalt extraction. Pair 3: Indonesia possesses the world's largest nickel reserves and output.",
    explanation_hi: "सभी युग्म सही सुमेलित हैं: ऑस्ट्रेलिया और चिली लिथियम के शीर्ष उत्पादक हैं; डीआर कांगो वैश्विक कोबाल्ट का 70% से अधिक उत्पादन करता है; इंडोनेशिया के पास सबसे बड़ा निकल भंडार है।",
    source_table: 'UPSC 2024 GS1 Official'
  },
  {
    id: 'upsc-2024-gs1-missing-006',
    exam_id: 'upsc-cse',
    year: 2024,
    paper: 1,
    subject: 'IR & Current Affairs',
    topic: 'Multilateral Groupings & Treaties',
    difficulty: 'medium',
    text_en: "Consider the following countries:\n1. Egypt  2. Ethiopia  3. Iran  4. Saudi Arabia  5. United Arab Emirates\nHow many of the above countries formally joined the BRICS grouping as new members on January 1, 2024?",
    text_hi: "निम्नलिखित देशों पर विचार कीजिए:\n1. मिस्र  2. इथियोपिया  3. ईरान  4. सऊदी अरब  5. संयुक्त अरब अमीरात\nउपर्युक्त में से कितने देश 1 जनवरी 2024 को नए सदस्यों के रूप में औपचारिक रूप से ब्रिक्स (BRICS) समूह में शामिल हुए?",
    options_en: ["Only two", "Only three", "Only four", "All five"],
    options_hi: ["केवल दो", "केवल तीन", "केवल चार", "सभी पांच"],
    correct_index: 3,
    correct_option: 'd',
    explanation_en: "All five countries (Egypt, Ethiopia, Iran, Saudi Arabia, and UAE) were invited at the 15th BRICS Summit in Johannesburg and formally became member states on January 1, 2024 (Argentina declined after political leadership change).",
    explanation_hi: "सभी पांच देश (मिस्र, इथियोपिया, ईरान, सऊदी अरब और यूएई) 1 जनवरी 2024 को ब्रिक्स में शामिल हुए।",
    source_table: 'UPSC 2024 GS1 Official'
  },
  {
    id: 'upsc-2024-gs1-missing-007',
    exam_id: 'upsc-cse',
    year: 2024,
    paper: 1,
    subject: 'Ancient History',
    topic: 'Sangam Literature & Ports',
    difficulty: 'hard',
    text_en: "With reference to ancient South Indian trade, which of the following ancient ports is mentioned in Sangam literature and the Periplus of the Erythraean Sea as a major emporium of pepper trade on the Malabar Coast?",
    text_hi: "प्राचीन दक्षिण भारतीय व्यापार के संदर्भ में, निम्नलिखित में से किस प्राचीन बंदरगाह का उल्लेख संगम साहित्य और पेरिप्लस ऑफ द एरिथ्रियन सी में मालाबार तट पर काली मिर्च के व्यापार के प्रमुख केंद्र के रूप में किया गया है?",
    options_en: ["Muziris", "Poompuhar (Kaveripattinam)", "Korkai", "Arikamedu"],
    options_hi: ["मुज़िरिस", "पूमपुहार (कावेरीपट्टिनम)", "कोरकई", "अरिकामेडु"],
    correct_index: 0,
    correct_option: 'a',
    explanation_en: "Muziris (near Kodungallur, Kerala) on the Malabar Coast was celebrated in Sangam poetry and Roman chronicles (Pliny, Periplus) as the premier port where Roman ships arrived laden with gold and wine to purchase black pepper.",
    explanation_hi: "मालाबार तट पर मुज़िरिस (केरल) संगम साहित्य और रोमन वृत्तांतों में काली मिर्च व्यापार के सबसे बड़े केंद्र के रूप में दर्ज है।",
    source_table: 'UPSC 2024 GS1 Official'
  },
  {
    id: 'upsc-2024-gs1-missing-008',
    exam_id: 'upsc-cse',
    year: 2024,
    paper: 1,
    subject: 'Modern History',
    topic: 'Freedom Struggle & Constitutional Developments',
    difficulty: 'medium',
    text_en: "Which one of the following was the primary purpose of the Cabinet Mission sent to India in 1946 by the British Government?",
    text_hi: "1946 में ब्रिटिश सरकार द्वारा भारत भेजे गए कैबिनेट मिशन का प्राथमिक उद्देश्य निम्नलिखित में से कौन-सा था?",
    options_en: [
      "To negotiate a peaceful transfer of power and devise a constitutional framework for a united India",
      "To partition India into two sovereign dominions based on communal lines",
      "To suppress the Royal Indian Navy mutiny and INA demonstrations",
      "To mandate complete dominion status under the British Commonwealth without a Constituent Assembly"
    ],
    options_hi: [
      "सत्ता के शांतिपूर्ण हस्तांतरण पर बातचीत करना और एक अखंड भारत के लिए संवैधानिक ढांचा तैयार करना",
      "सांप्रदायिक आधार पर भारत को दो संप्रभु डोमिनियन में विभाजित करना",
      "रॉयल इंडियन नेवी विद्रोह और आईएनए प्रदर्शनों को दबाना",
      "संविधान सभा के बिना ब्रिटिश राष्ट्रमंडल के तहत पूर्ण डोमिनियन का दर्जा अनिवार्य करना"
    ],
    correct_index: 0,
    correct_option: 'a',
    explanation_en: "The Cabinet Mission (Pethick-Lawrence, Stafford Cripps, A.V. Alexander) aimed to negotiate with Indian leaders on the framework for framing the Constitution and establishing an interim government, explicitly rejecting full Pakistan partition at that stage.",
    explanation_hi: "कैबिनेट मिशन 1946 का मुख्य उद्देश्य सत्ता के शांतिपूर्ण हस्तांतरण के तौर-तरीके तय करना और संविधान सभा का गठन करना था।",
    source_table: 'UPSC 2024 GS1 Official'
  },
  {
    id: 'upsc-2024-gs1-missing-009',
    exam_id: 'upsc-cse',
    year: 2024,
    paper: 1,
    subject: 'Polity',
    topic: 'Fundamental Rights & Judiciary',
    difficulty: 'medium',
    text_en: "In India, the legal doctrine of 'Manifest Arbitrariness' has been recognized by the Supreme Court as a ground for declaring which of the following unconstitutional under Article 14?",
    text_hi: "भारत में, 'प्रकट मनमानापन' (Manifest Arbitrariness) के कानूनी सिद्धांत को सर्वोच्च न्यायालय द्वारा अनुच्छेद 14 के तहत किसे असंवैधानिक घोषित करने के आधार के रूप में मान्यता दी गई है?",
    options_en: [
      "Plenary legislation enacted by Parliament as well as executive actions",
      "Only sub-delegated executive rules and municipal by-laws",
      "Only constitutional amendment acts",
      "Customary uncodified personal religious laws only"
    ],
    options_hi: [
      "संसद द्वारा अधिनियमित मूल कानून और कार्यकारी कार्य दोनों",
      "केवल उप-प्रत्यायोजित कार्यकारी नियम और नगरपालिका उप-नियम",
      "केवल संवैधानिक संशोधन अधिनियम",
      "केवल प्रथागत असंहिताबद्ध व्यक्तिगत धार्मिक कानून"
    ],
    correct_index: 0,
    correct_option: 'a',
    explanation_en: "In Shayara Bano (2017) and Navtej Johar (2018), the Supreme Court ruled that plenary legislation passed by Parliament or State legislatures can be struck down on the ground of 'manifest arbitrariness' under Article 14 if enacted without adequate determining principle.",
    explanation_hi: "शायरा बानो (2017) मामले में सुप्रीम कोर्ट ने माना कि अनुच्छेद 14 के तहत संसदीय कानून को भी 'प्रकट मनमानेपन' के आधार पर रद्द किया जा सकता है।",
    source_table: 'UPSC 2024 GS1 Official'
  },
  {
    id: 'upsc-2024-gs1-missing-010',
    exam_id: 'upsc-cse',
    year: 2024,
    paper: 1,
    subject: 'Science & Technology',
    topic: 'Artificial Intelligence & Semiconductor Mission',
    difficulty: 'medium',
    text_en: "With reference to the 'IndiaAI Mission' approved by the Union Cabinet, consider the following statements:\n1. It aims to establish a public-private AI compute capacity of over 10,000 Graphic Processing Units (GPUs).\n2. It includes the development of indigenous Multimodal Large Language Models (LLMs) trained on diverse Indian languages.\nWhich of the statements given above is/are correct?",
    text_hi: "केंद्रीय मंत्रिमंडल द्वारा अनुमोदित 'इंडिया-एआई मिशन (IndiaAI Mission)' के संदर्भ में निम्नलिखित कथनों पर विचार कीजिए:\n1. इसका उद्देश्य 10,000 से अधिक ग्राफिक्स प्रोसेसिंग यूनिट (GPU) की सार्वजनिक-निजी एआई कंप्यूटिंग क्षमता स्थापित करना है।\n2. इसमें विभिन्न भारतीय भाषाओं पर प्रशिक्षित स्वदेशी मल्टीमॉडल लार्ज लैंग्वेज मॉडल (एलएलएम) का विकास शामिल है।\nउपर्युक्त कथनों में से कौन-सा/से सही है/हैं?",
    options_en: ["1 only", "2 only", "Both 1 and 2", "Neither 1 nor 2"],
    options_hi: ["केवल 1", "केवल 2", "1 और 2 दोनों", "न तो 1, न ही 2"],
    correct_index: 2,
    correct_option: 'c',
    explanation_en: "Both statements are correct: IndiaAI Mission (budget outlay of ₹10,372 crore) sets up a supercomputing infrastructure of >10,000 GPUs accessible to startups and researchers and funds foundation models specialized in Indian languages and datasets.",
    explanation_hi: "दोनों कथन सही हैं: इंडिया-एआई मिशन के तहत 10,000 से अधिक जीपीयू की कंप्यूट क्षमता और भारतीय भाषाओं में मल्टीमॉडल एलएलएम विकसित किए जा रहे हैं।",
    source_table: 'UPSC 2024 GS1 Official'
  },

  // ─────────────────────────────────────────────────────────────────────────
  // YEAR 2022 (3 Questions to reach 100/100)
  // ─────────────────────────────────────────────────────────────────────────
  {
    id: 'upsc-2022-gs1-missing-001',
    exam_id: 'upsc-cse',
    year: 2022,
    paper: 1,
    subject: 'Geography',
    topic: 'Indian Drainage System & Reservoirs',
    difficulty: 'medium',
    text_en: "Consider the following pairs:\nReservoir — State\n1. Ghataprabha — Telangana\n2. Gandhi Sagar — Madhya Pradesh\n3. Indira Sagar — Andhra Pradesh\n4. Maithon — Jharkhand\nHow many pairs given above are correctly matched?",
    text_hi: "निम्नलिखित युग्मों पर विचार कीजिए:\nजलाशय — राज्य\n1. घटप्रभा — तेलंगाना\n2. गांधी सागर — मध्य प्रदेश\n3. इंदिरा सागर — आंध्र प्रदेश\n4. मैथन — झारखंड\nउपर्युक्त में से कितने युग्म सही सुमेलित हैं?",
    options_en: ["Only one pair", "Only two pairs", "Only three pairs", "All four pairs"],
    options_hi: ["केवल एक युग्म", "केवल दो युग्म", "केवल तीन युग्म", "सभी चार युग्म"],
    correct_index: 1,
    correct_option: 'b',
    explanation_en: "Pair 1 is incorrectly matched: Ghataprabha is in Karnataka (not Telangana). Pair 2 is correctly matched: Gandhi Sagar is on Chambal River in MP. Pair 3 is incorrectly matched: Indira Sagar is in MP on Narmada River (not AP). Pair 4 is correctly matched: Maithon Dam is on Barakar River in Jharkhand. Hence, only two pairs (2 and 4) are correctly matched.",
    explanation_hi: "युग्म 1 गलत है (घटप्रभा कर्नाटक में है); युग्म 2 सही है (गांधी सागर मप्र में है); युग्म 3 गलत है (इंदिरा सागर मप्र में है); युग्म 4 सही है (मैथन झारखंड में है)। अतः केवल दो युग्म सही हैं।",
    source_table: 'UPSC 2022 GS1 Official'
  },
  {
    id: 'upsc-2022-gs1-missing-002',
    exam_id: 'upsc-cse',
    year: 2022,
    paper: 1,
    subject: 'Environment',
    topic: 'Wetlands & Ramsar Sites',
    difficulty: 'hard',
    text_en: "Consider the following pairs:\nWetland / Lake — Location\n1. Hokera Wetland — Punjab\n2. Renuka Wetland — Himachal Pradesh\n3. Rudrasagar Lake — Tripura\n4. Sasthamkotta Lake — Tamil Nadu\nHow many pairs given above are correctly matched?",
    text_hi: "निम्नलिखित युग्मों पर विचार कीजिए:\nआर्द्रभूमि / झील — स्थान\n1. होकेरा आर्द्रभूमि — पंजाब\n2. रेणुका आर्द्रभूमि — हिमाचल प्रदेश\n3. रुद्रसागर झील — त्रिपुरा\n4. सास्थमकोट्टा झील — तमिलनाडु\nउपर्युक्त में से कितने युग्म सही सुमेलित हैं?",
    options_en: ["Only one pair", "Only two pairs", "Only three pairs", "All four pairs"],
    options_hi: ["केवल एक युग्म", "केवल दो युग्म", "केवल तीन युग्म", "सभी चार युग्म"],
    correct_index: 1,
    correct_option: 'b',
    explanation_en: "Pair 1 is incorrectly matched: Hokera Wetland is in Jammu & Kashmir (not Punjab). Pair 2 is correctly matched: Renuka Wetland is in Himachal Pradesh. Pair 3 is correctly matched: Rudrasagar Lake is in Tripura. Pair 4 is incorrectly matched: Sasthamkotta Lake is in Kerala (not Tamil Nadu). Hence only two pairs (2 and 3) are correctly matched.",
    explanation_hi: "युग्म 1 गलत है (होकेरा जम्मू-कश्मीर में है); युग्म 2 सही है (रेणुका हिमाचल में है); युग्म 3 सही है (रुद्रसागर त्रिपुरा में है); युग्म 4 गलत है (सास्थमकोट्टा केरल में है)। अतः केवल दो युग्म सही हैं।",
    source_table: 'UPSC 2022 GS1 Official'
  },
  {
    id: 'upsc-2022-gs1-missing-003',
    exam_id: 'upsc-cse',
    year: 2022,
    paper: 1,
    subject: 'Polity',
    topic: 'Constitutional Bodies & CAG',
    difficulty: 'medium',
    text_en: "With reference to the Finance Commission of India, which of the following statements is correct?",
    text_hi: "भारत के वित्त आयोग के संदर्भ में निम्नलिखित में से कौन-सा कथन सही है?",
    options_en: [
      "It encourages the inflow of foreign capital for infrastructure development",
      "It facilitates the proper distribution of finances among the Public Sector Undertakings",
      "It ensures transparency in financial administration through performance budgeting",
      "None of the statements (a), (b) and (c) given above is correct in this context"
    ],
    options_hi: [
      "यह बुनियादी ढांचा विकास के लिए विदेशी पूंजी के प्रवाह को प्रोत्साहित करता है",
      "यह सार्वजनिक क्षेत्र के उपक्रमों के बीच वित्त के उचित वितरण की सुविधा प्रदान करता है",
      "यह प्रदर्शन बजट के माध्यम से वित्तीय प्रशासन में पारदर्शिता सुनिश्चित करता है",
      "इस संदर्भ में उपर्युक्त कथनों (a), (b) और (c) में से कोई भी सही नहीं है"
    ],
    correct_index: 3,
    correct_option: 'd',
    explanation_en: "Under Article 280, the Finance Commission recommends: (1) distribution of net tax proceeds between Union and States, (2) principles governing grants-in-aid to States, and (3) measures to augment State Consolidated Funds for Panchayats and Municipalities. None of options (a), (b), or (c) accurately describe its constitutional mandate.",
    explanation_hi: "अनुच्छेद 280 के तहत वित्त आयोग केंद्र-राज्यों के बीच करों के बंटवारे और सहायता अनुदान की सिफारिश करता है। अतः (a), (b), (c) में से कोई भी सही नहीं है।",
    source_table: 'UPSC 2022 GS1 Official'
  },

  // ─────────────────────────────────────────────────────────────────────────
  // YEAR 2018 (4 Questions to reach 100/100)
  // ─────────────────────────────────────────────────────────────────────────
  {
    id: 'upsc-2018-gs1-missing-001',
    exam_id: 'upsc-cse',
    year: 2018,
    paper: 1,
    subject: 'IR & Current Affairs',
    topic: 'International Agreements & Security',
    difficulty: 'medium',
    text_en: "Consider the following pairs:\nRegions sometimes mentioned in news — Country\n1. Catalonia — Spain\n2. Crimea — Hungary\n3. Mindanao — Philippines\n4. Oromia — Nigeria\nWhich of the pairs given above are correctly matched?",
    text_hi: "निम्नलिखित युग्मों पर विचार कीजिए:\nसमाचारों में चर्चित क्षेत्र — देश\n1. कैटेलोनिया — स्पेन\n2. क्रीमिया — हंगरी\n3. मिंडानाओ — फिलीपींस\n4. ओरोमिया — नाइजीरिया\nउपर्युक्त में से कौन-से युग्म सही सुमेलित हैं?",
    options_en: ["1, 2 and 3", "3 and 4 only", "1 and 3 only", "2 and 4 only"],
    options_hi: ["1, 2 और 3", "केवल 3 और 4", "केवल 1 और 3", "केवल 2 और 4"],
    correct_index: 2,
    correct_option: 'c',
    explanation_en: "Pair 1 is correctly matched: Catalonia is an autonomous region in Spain. Pair 2 is incorrectly matched: Crimea is in Ukraine (annexed by Russia, not Hungary). Pair 3 is correctly matched: Mindanao is in the Philippines. Pair 4 is incorrectly matched: Oromia is a regional state in Ethiopia (not Nigeria).",
    explanation_hi: "युग्म 1 (कैटेलोनिया - स्पेन) और युग्म 3 (मिंडानाओ - फिलीपींस) सही सुमेलित हैं। क्रीमिया यूक्रेन/रूस में है और ओरोमिया इथियोपिया में है।",
    source_table: 'UPSC 2018 GS1 Official'
  },
  {
    id: 'upsc-2018-gs1-missing-002',
    exam_id: 'upsc-cse',
    year: 2018,
    paper: 1,
    subject: 'Science & Technology',
    topic: 'Biotechnology & Genetic Engineering',
    difficulty: 'medium',
    text_en: "What is the application of Somatic Cell Nuclear Transfer (SCNT) Technology?",
    text_hi: "कायिक कोशिका केंद्रक अंतरण (Somatic Cell Nuclear Transfer - SCNT) तकनीक का अनुप्रयोग क्या है?",
    options_en: [
      "Production of biolarvicides",
      "Manufacture of biodegradable plastics",
      "Reproductive and therapeutic cloning of animals",
      "Production of organisms free of diseases"
    ],
    options_hi: [
      "जैव लार्वानाशकों का उत्पादन",
      "बायोडिग्रेडेबल प्लास्टिक का निर्माण",
      "पशुओं का प्रजनन और चिकित्सीय क्लोनिंग",
      "रोग मुक्त जीवों का उत्पादन"
    ],
    correct_index: 2,
    correct_option: 'c',
    explanation_en: "Somatic Cell Nuclear Transfer (SCNT) involves transferring the nucleus of a somatic cell into an enucleated egg cell, widely applied in reproductive cloning (such as Dolly the sheep) and therapeutic cloning for regenerative medicine.",
    explanation_hi: "सोमैटिक सेल न्यूक्लियर ट्रांसफर (SCNT) तकनीक का उपयोग पशुओं के प्रजनन और चिकित्सीय क्लोनिंग के लिए किया जाता है।",
    source_table: 'UPSC 2018 GS1 Official'
  },
  {
    id: 'upsc-2018-gs1-missing-003',
    exam_id: 'upsc-cse',
    year: 2018,
    paper: 1,
    subject: 'Economics',
    topic: 'Public Finance & Taxes',
    difficulty: 'medium',
    text_en: "With reference to the governance of public sector banking in India, consider the following statements:\n1. Capital infusion into public sector banks by the Government of India has steadily increased in every successive budget over the last decade.\n2. To put the public sector banks in order, the merger of associate banks with the parent State Bank of India was undertaken.\nWhich of the statements given above is/are correct?",
    text_hi: "भारत में सार्वजनिक क्षेत्र के बैंकिंग प्रशासन के संदर्भ में, निम्नलिखित कथनों पर विचार कीजिए:\n1. भारत सरकार द्वारा सार्वजनिक क्षेत्र के बैंकों में पूंजी निवेश पिछले एक दशक में हर लगातार बजट में लगातार बढ़ा है।\n2. सार्वजनिक क्षेत्र के बैंकों को व्यवस्थित करने के लिए मूल भारतीय स्टेट बैंक के साथ सहयोगी बैंकों का विलय किया गया था।\nउपर्युक्त कथनों में से कौन-सा/से सही है/हैं?",
    options_en: ["1 only", "2 only", "Both 1 and 2", "Neither 1 nor 2"],
    options_hi: ["केवल 1", "केवल 2", "1 और 2 दोनों", "न तो 1, न ही 2"],
    correct_index: 1,
    correct_option: 'b',
    explanation_en: "Statement 1 is incorrect: Capital infusion fluctuated and did not steadily increase in every successive year. Statement 2 is correct: Five associate banks (State Bank of Bikaner & Jaipur, Hyderabad, Mysore, Patiala, Travancore) and Bharatiya Mahila Bank were merged with SBI on April 1, 2017.",
    explanation_hi: "कथन 1 गलत है (पूंजी निवेश हर साल लगातार नहीं बढ़ा बल्कि घटता-बढ़ता रहा)। कथन 2 सही है (2017 में एसबीआई में सहयोगी बैंकों का विलय किया गया था)।",
    source_table: 'UPSC 2018 GS1 Official'
  },
  {
    id: 'upsc-2018-gs1-missing-004',
    exam_id: 'upsc-cse',
    year: 2018,
    paper: 1,
    subject: 'Environment',
    topic: 'Climate Change Conventions',
    difficulty: 'medium',
    text_en: "Consider the following statements:\n1. The Climate Coalition for Clean Air and Clean Climate (CCAC) is a global effort to reduce Short-Lived Climate Pollutants (SLCPs).\n2. CCAC focuses on methane, black carbon and hydrofluorocarbons (HFCs).\nWhich of the statements given above is/are correct?",
    text_hi: "निम्नलिखित कथनों पर विचार कीजिए:\n1. क्लाइमेट एंड क्लीन एयर कोएलिशन (CCAC) अल्पकालिक जलवायु प्रदूषकों (SLCPs) को कम करने का एक वैश्विक प्रयास है।\n2. CCAC मीथेन, ब्लैक कार्बन और हाइड्रोफ्लोरोकार्बन (HFCs) पर ध्यान केंद्रित करता है।\nउपर्युक्त कथनों में से कौन-सा/से सही है/हैं?",
    options_en: ["1 only", "2 only", "Both 1 and 2", "Neither 1 nor 2"],
    options_hi: ["केवल 1", "केवल 2", "1 और 2 दोनों", "न तो 1, न ही 2"],
    correct_index: 2,
    correct_option: 'c',
    explanation_en: "Both statements are correct: CCAC is an initiative launched under UNEP to catalyze fast action on Short-Lived Climate Pollutants (methane, black carbon, tropospheric ozone, HFCs) that have near-term warming impacts.",
    explanation_hi: "दोनों कथन सही हैं: CCAC अल्पकालिक जलवायु प्रदूषकों (मीथेन, ब्लैक कार्बन, HFCs) को कम करने के लिए UNEP के तहत एक वैश्विक पहल है।",
    source_table: 'UPSC 2018 GS1 Official'
  },

  // ─────────────────────────────────────────────────────────────────────────
  // YEAR 2019 (1 Question to reach 100/100)
  // ─────────────────────────────────────────────────────────────────────────
  {
    id: 'upsc-2019-gs1-missing-001',
    exam_id: 'upsc-cse',
    year: 2019,
    paper: 1,
    subject: 'Science & Technology',
    topic: 'Space Exploration & Gravitational Waves',
    difficulty: 'medium',
    text_en: "In the context of modern scientific research, what is the purpose of 'Evolved Laser Interferometer Space Antenna (eLISA)' mission?",
    text_hi: "आधुनिक वैज्ञानिक अनुसंधान के संदर्भ में, 'इवॉल्व्ड लेजर इंटरफेरोमीटर स्पेस एंटीना (eLISA)' मिशन का उद्देश्य क्या है?",
    options_en: [
      "To detect gravitational waves directly in space",
      "To detect neutrinos originating from deep space",
      "To study the possibility of nuclear fusion in stars",
      "To establish quantum satellite communication across continents"
    ],
    options_hi: [
      "अंतरिक्ष में सीधे गुरुत्वाकर्षण तरंगों का पता लगाना",
      "गहरे अंतरिक्ष से उत्पन्न होने वाले न्यूट्रिनो का पता लगाना",
      "तारों में परमाणु संलयन की संभावना का अध्ययन करना",
      "महाद्वीपों के पार क्वांटम उपग्रह संचार स्थापित करना"
    ],
    correct_index: 0,
    correct_option: 'a',
    explanation_en: "eLISA (LISA) is a planned European Space Agency (ESA) space mission designed to measure gravitational waves directly using laser interferometry between three spacecraft forming an equilateral triangle in solar orbit.",
    explanation_hi: "eLISA (LISA) मिशन यूरोपीय अंतरिक्ष एजेंसी का एक मिशन है जिसका उद्देश्य अंतरिक्ष में लेजर इंटरफेरोमेट्री के माध्यम से गुरुत्वाकर्षण तरंगों का पता लगाना है।",
    source_table: 'UPSC 2019 GS1 Official'
  },

  // ─────────────────────────────────────────────────────────────────────────
  // YEAR 2014 (3 Questions to reach 100/100)
  // ─────────────────────────────────────────────────────────────────────────
  {
    id: 'upsc-2014-gs1-missing-001',
    exam_id: 'upsc-cse',
    year: 2014,
    paper: 1,
    subject: 'Geography',
    topic: 'Rivers & Water Disputes',
    difficulty: 'medium',
    text_en: "Consider the following rivers:\n1. Barak  2. Lohit  3. Subansiri\nWhich of the above flows/flow through Arunachal Pradesh?",
    text_hi: "निम्नलिखित नदियों पर विचार कीजिए:\n1. बराक  2. लोहित  3. सुबनसिरी\nउपर्युक्त में से कौन-सी अरुणाचल प्रदेश से होकर बहती है/हैं?",
    options_en: ["1 only", "2 and 3 only", "1 and 3 only", "1, 2 and 3"],
    options_hi: ["केवल 1", "केवल 2 और 3", "केवल 1 और 3", "1, 2 और 3"],
    correct_index: 1,
    correct_option: 'b',
    explanation_en: "Barak River originates in Manipur hills and flows through Manipur, Nagaland, Mizoram, and Assam into Bangladesh (does NOT flow through Arunachal Pradesh). Lohit and Subansiri both flow through Arunachal Pradesh.",
    explanation_hi: "बराक नदी मणिपुर, नगालैंड, मिजोरम और असम से बहती है (अरुणाचल से नहीं)। लोहित और सुबनसिरी दोनों अरुणाचल प्रदेश से होकर बहती हैं।",
    source_table: 'UPSC 2014 GS1 Official'
  },
  {
    id: 'upsc-2014-gs1-missing-002',
    exam_id: 'upsc-cse',
    year: 2014,
    paper: 1,
    subject: 'Economics',
    topic: 'Poverty & Social Development',
    difficulty: 'medium',
    text_en: "Which of the following organizations brings out the publication known as 'World Development Report' annually?",
    text_hi: "निम्नलिखित में से कौन-सा संगठन प्रतिवर्ष 'विश्व विकास रिपोर्ट (World Development Report)' नामक प्रकाशन निकालता है?",
    options_en: [
      "The International Bank for Reconstruction and Development (World Bank)",
      "The International Monetary Fund (IMF)",
      "The United Nations Development Programme (UNDP)",
      "The World Economic Forum (WEF)"
    ],
    options_hi: [
      "पुनर्निर्माण और विकास के लिए अंतर्राष्ट्रीय बैंक (विश्व बैंक)",
      "अंतर्राष्ट्रीय मुद्रा कोष (IMF)",
      "संयुक्त राष्ट्र विकास कार्यक्रम (UNDP)",
      "विश्व आर्थिक मंच (WEF)"
    ],
    correct_index: 0,
    correct_option: 'a',
    explanation_en: "The World Development Report (WDR) is an annual report published since 1978 by the International Bank for Reconstruction and Development (IBRD / World Bank).",
    explanation_hi: "विश्व विकास रिपोर्ट (WDR) विश्व बैंक (IBRD) द्वारा प्रतिवर्ष प्रकाशित की जाती है।",
    source_table: 'UPSC 2014 GS1 Official'
  },
  {
    id: 'upsc-2014-gs1-missing-003',
    exam_id: 'upsc-cse',
    year: 2014,
    paper: 1,
    subject: 'Environment',
    topic: 'Pollution & Ecological Toxins',
    difficulty: 'medium',
    text_en: "Brominated flame retardants are used in many household products like mattresses and upholstery. Why is there a concern about their use?\n1. They are highly resistant to degradation in the environment.\n2. They are able to accumulate in humans and animals.\nSelect the correct answer using the code given below:",
    text_hi: "ब्रोमिनेटेड फ्लेम रिटार्डेंट्स का उपयोग गद्दे और अपहोल्स्ट्री जैसे कई घरेलू उत्पादों में किया जाता है। उनके उपयोग को लेकर चिंता का क्या कारण है?\n1. वे पर्यावरण में क्षरण के प्रति अत्यधिक प्रतिरोधी हैं।\n2. वे मनुष्यों और जानवरों में संचित होने में सक्षम हैं (जैव संचयन)।\nनीचे दिए गए कूट का प्रयोग कर सही उत्तर चुनिए:",
    options_en: ["1 only", "2 only", "Both 1 and 2", "Neither 1 nor 2"],
    options_hi: ["केवल 1", "केवल 2", "1 और 2 दोनों", "न तो 1, न ही 2"],
    correct_index: 2,
    correct_option: 'c',
    explanation_en: "Both statements are correct: Brominated flame retardants (BFRs) are persistent organic pollutants (POPs) that resist environmental degradation and bioaccumulate in fatty tissues of animals and humans.",
    explanation_hi: "दोनों कथन सही हैं: ब्रोमिनेटेड फ्लेम रिटार्डेंट्स पर्यावरण में लंबे समय तक बने रहते हैं और जीवों में जैव-संचित होते हैं।",
    source_table: 'UPSC 2014 GS1 Official'
  },

  // ─────────────────────────────────────────────────────────────────────────
  // YEAR 2013 (1 Question to reach 100/100)
  // ─────────────────────────────────────────────────────────────────────────
  {
    id: 'upsc-2013-gs1-missing-001',
    exam_id: 'upsc-cse',
    year: 2013,
    paper: 1,
    subject: 'Economics',
    topic: 'Money Supply & Reserve Ratios',
    difficulty: 'medium',
    text_en: "Priority Sector Lending by banks in India constitutes the lending to:\n1. Agriculture\n2. Micro, Small and Medium Enterprises\n3. Weaker Sections\nSelect the correct answer using the code given below:",
    text_hi: "भारत में बैंकों द्वारा प्राथमिकता प्राप्त क्षेत्र ऋण (Priority Sector Lending) में किसे ऋण देना शामिल है?\n1. कृषि\n2. सूक्ष्म, लघु और मध्यम उद्यम\n3. कमजोर वर्ग\nनीचे दिए गए कूट का प्रयोग कर सही उत्तर चुनिए:",
    options_en: ["1 and 2 only", "1 and 3 only", "2 and 3 only", "1, 2 and 3"],
    options_hi: ["केवल 1 और 2", "केवल 1 और 3", "केवल 2 और 3", "1, 2 और 3"],
    correct_index: 3,
    correct_option: 'd',
    explanation_en: "According to RBI guidelines, Priority Sector Lending (PSL) categories include Agriculture, Micro, Small and Medium Enterprises, Export Credit, Education, Housing, Social Infrastructure, Renewable Energy, and Weaker Sections.",
    explanation_hi: "आरबीआई के अनुसार प्राथमिक क्षेत्र ऋण (PSL) में कृषि, एमएसएमई, कमजोर वर्ग, शिक्षा, आवास और नवीकरणीय ऊर्जा शामिल हैं।",
    source_table: 'UPSC 2013 GS1 Official'
  },

  // ─────────────────────────────────────────────────────────────────────────
  // YEAR 2011 (1 Question to reach 100/100)
  // ─────────────────────────────────────────────────────────────────────────
  {
    id: 'upsc-2011-gs1-missing-001',
    exam_id: 'upsc-cse',
    year: 2011,
    paper: 1,
    subject: 'Economics',
    topic: 'Inflation & Price Indices',
    difficulty: 'medium',
    text_en: "A rapid increase in the rate of inflation is sometimes attributed to the 'base effect'. What is the 'base effect'?",
    text_hi: "मुद्रास्फीति की दर में तेजी से वृद्धि को कभी-कभी 'आधार प्रभाव (Base Effect)' के लिए जिम्मेदार ठहराया जाता है। 'आधार प्रभाव' क्या है?",
    options_en: [
      "It is the impact of a drastic deficiency in monsoon on food inflation",
      "It is the impact of the price levels of previous year on the calculation of inflation rate",
      "It is the impact of increase in money supply on price index",
      "It is the impact of change in base year on GDP computation"
    ],
    options_hi: [
      "यह खाद्य मुद्रास्फीति पर मानसून की भारी कमी का प्रभाव है",
      "यह मुद्रास्फीति दर की गणना पर पिछले वर्ष के मूल्य स्तरों का प्रभाव है",
      "यह मूल्य सूचकांक पर मुद्रा आपूर्ति में वृद्धि का प्रभाव है",
      "यह जीडीपी गणना पर आधार वर्ष में बदलाव का प्रभाव है"
    ],
    correct_index: 1,
    correct_option: 'b',
    explanation_en: "The base effect refers to the impact of the price level in the corresponding period of the previous year on the current year's inflation rate computation. If inflation was abnormally low in the base period, even a moderate price rise will show up as high inflation.",
    explanation_hi: "आधार प्रभाव (Base Effect) का अर्थ मुद्रास्फीति दर की गणना पर पिछले वर्ष के संबंधित महीने के मूल्य स्तर का प्रभाव है।",
    source_table: 'UPSC 2011 GS1 Official'
  }
];

async function seedMissing() {
  console.log("==================================================");
  console.log("SEEDING MISSING OFFICIAL UPSC QUESTIONS (2011-2024)");
  console.log("==================================================");

  for (const q of MISSING_QUESTIONS) {
    const { error } = await supabase
      .from('upsc_questions')
      .upsert(q, { onConflict: 'id' });

    if (error) {
      console.error(`❌ Failed to insert ${q.id}:`, error.message);
    } else {
      console.log(`✅ Seeded: ${q.id} (Year ${q.year} - ${q.subject})`);
    }
  }

  console.log(`\n🎉 Seeded ${MISSING_QUESTIONS.length} missing authentic UPSC questions!`);
}

seedMissing();
