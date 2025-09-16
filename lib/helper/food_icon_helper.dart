import 'emun.dart';

class FoodIconHelper {
  // Lấy FoodType từ tên tiếng Việt
  static FoodType getFoodType(String name) {
    switch (name.toLowerCase()) {
      // ----- Trái cây -----
      case "táo":
        return FoodType.apple;
      case "đào":
        return FoodType.apricot;
      case "bơ":
        return FoodType.avocado;
      case "chuối":
        return FoodType.banana;
      case "việt quất":
        return FoodType.blueberry;
      case "cherry":
        return FoodType.cherry;
      case "thanh long":
        return FoodType.dragonFruit;
      case "nho":
        return FoodType.grape;
      case "bưởi":
        return FoodType.grapefruit;
      case "kiwi":
        return FoodType.kiwi;
      case "chanh vàng":
        return FoodType.lemon;
      case "chanh":
        return FoodType.lime;
      case "sầu riêng":
        return FoodType.durian;
      case "xoài":
        return FoodType.mango;
      case "lê":
        return FoodType.pear;
      case "dứa gai":
        return FoodType.pineapple;
      case "lựu":
        return FoodType.pomegranate;
      case "chôm chôm":
        return FoodType.rambutan;
      case "dưa hấu":
        return FoodType.watermelon;
      case "cà chua":
        return FoodType.tomato;
      case "dâu tây":
        return FoodType.strawberry;
      case "dưa gang":
        return FoodType.melon;
      case "dưa lưới":
        return FoodType.cantaloupe;
      case "vải thiều":
        return FoodType.lychee;
      case "hồng":
        return FoodType.persimmon;
      case "đu đủ":
        return FoodType.papaya;
      case "mận":
        return FoodType.plum;
      case "nhãn":
        return FoodType.longan;
      case "dừa":
        return FoodType.coconut;
      case "ổi":
        return FoodType.guava;

      // ----- Rau -----
      case "cải thảo":
        return FoodType.chineseCabbage;
      case "bắp cải":
        return FoodType.cabbage;
      case "cà rốt":
        return FoodType.carrot;
      case "hành":
        return FoodType.onion;
      case "cà tím":
        return FoodType.eggplant;
      case "bí đỏ":
        return FoodType.pumpkin;
      case "hành lá":
        return FoodType.greenOnion;
      case "hẹ":
        return FoodType.chives;
      case "củ sen":
        return FoodType.potato;
      case "khoai tây":
        return FoodType.tomato;
      case "nấm":
        return FoodType.mushroom;
      case "hành tây":
        return FoodType.onionTay;
      case "cải thìa":
        return FoodType.bokChoy;
      case "giá đỗ":
        return FoodType.sprouts;
      case "khoai lang":
        return FoodType.sweetPotato;
      case "dưa chuột":
        return FoodType.cucumber;
      case "khoai môn":
        return FoodType.taro;
      case "tía tô":
        return FoodType.perilla;
      case "ngô":
        return FoodType.corn;
      case "su hào":
        return FoodType.kohlrabi;
      case "bí ngô":
        return FoodType.bingo;
      case "ớt":
        return FoodType.chili;
      case "ớt chuông":
        return FoodType.bellPepper;
      case "súp lơ trắng":
        return FoodType.cauliflower;
      case "súp lơ xanh":
        return FoodType.broccoli;
      case "đậu cuve":
        return FoodType.greenBeans;
      case "mướp":
        return FoodType.food;
      case "quả bí":
        return FoodType.zucchini;
      case "rau mùi":
        return FoodType.coriander;
      case "tỏi":
        return FoodType.garlic;
      case "mướp đắng":
        return FoodType.bitterGourd;
      case "húng quế":
        return FoodType.basil;
      case "rau muống":
        return FoodType.morningGlory;
      case "rau mồng tơi":
        return FoodType.spinach1;
      case "rau ngót":
        return FoodType.rauNgot;
      case "măng":
        return FoodType.bamboo;

      // ----- Thịt -----
      case "ba chỉ heo":
        return FoodType.porkBelly;
      case "thịt vịt":
        return FoodType.duck;
      case "thịt gà":
        return FoodType.chicken;
      case "cánh gà":
        return FoodType.chickenWings;
      case "đùi gà":
        return FoodType.drumstick;
      case "giăm bông":
        return FoodType.ham;
      case "sườn":
        return FoodType.ribs;
      case "thăn bò":
        return FoodType.tenderloin;
      case "chân giò heo":
        return FoodType.porkLeg;
      case "thịt bò":
        return FoodType.beef;
      case "thịt lợn":
        return FoodType.pig;
      case "chế phẩm từ thịt":
        return FoodType.meatProduct;
      case "trứng":
        return FoodType.eggs;
      case "trứng cút":
        return FoodType.quailEggs;
      case "bít tết":
        return FoodType.tomahawk;

      // ----- Hải sản -----
      case "tôm":
        return FoodType.shrimp;
      case "cá":
        return FoodType.fish;
      case "lươn":
        return FoodType.eel;
      case "cua":
        return FoodType.crab;
      case "ốc":
        return FoodType.snail;
      case "ngao":
        return FoodType.clam;
      case "hến":
        return FoodType.mussel;
      case "trai":
        return FoodType.shellfish;
      case "sò":
        return FoodType.scallop;
      case "mực":
        return FoodType.squid;
      case "cá hồi":
        return FoodType.salmon;
      case "bạch tuộc":
        return FoodType.octopus;
      case "trứng cá":
        return FoodType.roe;
      case "tôm hùm":
        return FoodType.lobster;
      case "sứa":
        return FoodType.jellyfish;
      case "cua hoàng đế":
        return FoodType.snowCrab;
      case "dong biển":
        return FoodType.seaweed;

      // --- Sữa & chế phẩm từ sữa ---
      case "sữa hạnh nhân":
        return FoodType.almondMilk;
      case "phô mai":
        return FoodType.cheese;
      case "trà sữa":
        return FoodType.bubbleTea;
      case "burrata":
        return FoodType.burrata;
      case "bơ sữa":
        return FoodType.butter;
      case "sữa":
        return FoodType.milk;
      case "phô mai mozzarella":
        return FoodType.mozzarella;
      case "probi":
        return FoodType.probi;
      case "sữa chua":
        return FoodType.yogurt;
      case "kem tươi":
        return FoodType.whippedCream;
      case "sữa ngô":
        return FoodType.cornMilk;
      case "lassi":
        return FoodType.lassi;

      // --- Đồ uống ---
      case "coca":
        return FoodType.coke;
      case "cà phê":
        return FoodType.coffee;
      case "nước cam":
        return FoodType.orangeJuice;
      case "nước chanh":
        return FoodType.lemonade;
      case "nước dừa":
        return FoodType.coconutDrink;
      case "nước ngọt có ga":
        return FoodType.softDrink;
      case "nước suối":
        return FoodType.water;
      case "nước tăng lực":
        return FoodType.energyDrink;
      case "nước ép":
        return FoodType.juice;
      case "nước điện giải":
        return FoodType.sportDrink;
      case "trà":
        return FoodType.tea;
      case "trà sữa trân châu":
        return FoodType.bubbleTeaDrink;
      case "trà túi lọc":
        return FoodType.teaBag;
      case "trà gừng":
        return FoodType.gingerTea;
      case "sôcola nóng":
        return FoodType.hotChocolate;
      case "trà chanh":
        return FoodType.lemonTea;

      // --- Đồ uống có cồn ---
      case "bia":
        return FoodType.beer;
      case "rượu mạnh":
        return FoodType.brandy;
      case "sâm panh":
        return FoodType.champagne;
      case "cocktail":
        return FoodType.cocktail;
      case "rượu thảo mộc":
        return FoodType.herbalLiquor;
      case "rượu rum":
        return FoodType.rum;
      case "rượu hoa quả":
        return FoodType.sangria;
      case "sake":
        return FoodType.sake;
      case "vodka":
        return FoodType.vodka;
      case "whiskey":
        return FoodType.whiskey;
      case "rượu vang":
        return FoodType.wine;
      case "soju":
        return FoodType.soju;
      case "strongbow":
        return FoodType.strongbow;

      // --- Nước sốt ---
      case "tương ớt":
        return FoodType.hotSauce;
      case "tương cà":
        return FoodType.ketchup;
      case "nước mắm":
        return FoodType.fishSauce;
      case "mayonnaise":
        return FoodType.mayonnaise;
      case "mù tạt":
        return FoodType.mustard;
      case "wasabi":
        return FoodType.wasabi;
      case "xì dầu":
        return FoodType.soySauce;
      case "tương bần":
        return FoodType.tuongBan;
      case "mật ong":
        return FoodType.honey;
      case "sốt bbq":
        return FoodType.bbqSauce;
      case "giấm gạo":
        return FoodType.riceVinegar;
      case "giấm táo":
        return FoodType.appleCiderVinegar;
      case "mứt dâu":
        return FoodType.strawberryJam;

      // --- Gia vị ---
      case "muối":
        return FoodType.salt;
      case "bột ớt":
        return FoodType.chiliPowder;
      case "đường":
        return FoodType.sugar;
      case "quế":
        return FoodType.cinnamon;
      case "bột nghệ":
        return FoodType.turmeric;
      case "gừng":
        return FoodType.gingerSpice;
      case "tỏi":
        return FoodType.garlic;
      case "sả":
        return FoodType.lemongrass;
      case "tiêu":
        return FoodType.pepperSpice;
      case "sa tế":
        return FoodType.sate;
      case "hạt nêm":
        return FoodType.seasoning;
      case "bột ngọt":
        return FoodType.msg;

      // --- Bánh mì & ngũ cốc ---
      case "bánh mì vòng":
        return FoodType.bagel;
      case "bánh mì":
        return FoodType.bread;
      case "bánh mì tròn":
        return FoodType.breadCircle;
      case "bánh mì brioche":
        return FoodType.brioche;
      case "donut":
        return FoodType.donut;
      case "sandwich":
        return FoodType.sandwich;
      case "bánh mì pate":
        return FoodType.pateBread;
      case "pizza":
        return FoodType.pizza;
      case "bánh mì sandwich":
        return FoodType.sandwichLoaf;
      case "pancake":
        return FoodType.pancake;

      // ----- Tráng miệng -----
      case "chè":
        return FoodType.sweetSoup;
      case "kem":
        return FoodType.iceCream;
      case "bánh ngọt":
        return FoodType.cake;
      case "bánh tar trứng":
        return FoodType.eggTart;
      case "sô cô la":
        return FoodType.chocolate;
      case "kẹo":
        return FoodType.candy;
      case "caramel":
        return FoodType.caramel;
      case "kẹo cao su":
        return FoodType.chewingGum;
      case "bánh quy":
        return FoodType.cookie;
      case "thanh năng lượng":
        return FoodType.energyBar;
      case "pudding":
        return FoodType.pudding;
      case "bánh cuộn":
        return FoodType.swissRoll;
      case "snack khoai tây":
        return FoodType.potatoChips;
      case "bim bim":
        return FoodType.snack;
      case "bánh trung thu":
        return FoodType.moonCake;

      // ----- Quả hạch -----
      case "hạt bí":
        return FoodType.pumpkinSeed;
      case "hạt hướng dương":
        return FoodType.sunflowerSeed;
      case "hạt điều":
        return FoodType.cashew;
      case "hạt óc chó":
        return FoodType.walnut;
      case "hạnh nhân":
        return FoodType.almond;
      case "hạt dẻ":
        return FoodType.chestnut;
      case "mắc ca":
        return FoodType.macadamia;
      case "đậu phộng":
        return FoodType.peanut;
      case "đậu nành":
        return FoodType.soybean;
      case "hạt sen":
        return FoodType.lotusSeed;
      case "hạt dẻ cười":
        return FoodType.pistachio;
      case "cacao":
        return FoodType.cacao;

      // ----- Ngũ cốc -----
      case "gạo":
        return FoodType.rice;
      case "đậu đen":
        return FoodType.blackBean;
      case "đậu đỏ":
        return FoodType.redBean;
      case "yến mạch":
        return FoodType.oat;
      case "hạt kê":
        return FoodType.millet;
      case "lúa mạch":
        return FoodType.barley;
      case "gạo lứt":
        return FoodType.brownRice;
      case "hạt ngô":
        return FoodType.cornHat;

      case "vân vân":
        return FoodType.etc;

      default:
        return FoodType.unknown;
    }
  }

  // Trả về đường dẫn icon theo FoodType (đã bỏ assets/)
  static String getIcon(FoodType type) {
    switch (type) {
      // ----- Trái cây -----
      case FoodType.apple:
        return "assets/icons/fruit/apple.png";
      case FoodType.apricot:
        return "assets/icons/fruit/apricot.png";
      case FoodType.avocado:
        return "assets/icons/fruit/avocado.png";
      case FoodType.banana:
        return "assets/icons/fruit/banana.png";
      case FoodType.blueberry:
        return "assets/icons/fruit/blueberry.png";
      case FoodType.cherry:
        return "assets/icons/fruit/berry.png";
      case FoodType.dragonFruit:
        return "assets/icons/fruit/dragon-fruit.png";
      case FoodType.grape:
        return "assets/icons/fruit/grapes.png";
      case FoodType.grapefruit:
        return "assets/icons/fruit/grapefruit.png";
      case FoodType.kiwi:
        return "assets/icons/fruit/kiwi.png";
      case FoodType.lemon:
        return "assets/icons/fruit/lemon.png";
      case FoodType.lime:
        return "assets/icons/fruit/lime.png";
      case FoodType.durian:
        return "assets/icons/fruit/durian.png";
      case FoodType.mango:
        return "assets/icons/fruit/mango.png";
      case FoodType.pear:
        return "assets/icons/fruit/pear.png";
      case FoodType.pineapple:
        return "assets/icons/fruit/pineapple.png";
      case FoodType.pomegranate:
        return "assets/icons/fruit/pomegranate.png";
      case FoodType.rambutan:
        return "assets/icons/fruit/rambutan.png";
      case FoodType.watermelon:
        return "assets/icons/fruit/watermelon.png";
      case FoodType.tomato:
        return "assets/icons/fruit/tomato.png";
      case FoodType.strawberry:
        return "assets/icons/fruit/strawberrry.png";
      case FoodType.melon:
        return "assets/icons/fruit/melon.png";
      case FoodType.cantaloupe:
        return "assets/icons/fruit/melon (1).png";
      case FoodType.lychee:
        return "assets/icons/fruit/lychee.png";
      case FoodType.persimmon:
        return "assets/icons/fruit/persimmon.png";
      case FoodType.papaya:
        return "assets/icons/fruit/papaya.png";
      case FoodType.plum:
        return "assets/icons/fruit/plum.png";
      case FoodType.longan:
        return "assets/icons/fruit/longan.png";
      case FoodType.coconut:
        return "assets/icons/fruit/coconut.png";
      case FoodType.guava:
        return "assets/icons/fruit/guava.png";

      // ----- Rau -----
      case FoodType.chineseCabbage:
        return "assets/icons/vegetables/chinese-cabbage.png";
      case FoodType.cabbage:
        return "assets/icons/vegetables/cabbage.png";
      case FoodType.carrot:
        return "assets/icons/vegetables/carrots.png";
      case FoodType.onion:
        return "assets/icons/vegetables/onion.png";
      case FoodType.eggplant:
        return "assets/icons/vegetables/eggplant.png";
      case FoodType.pumpkin:
        return "assets/icons/vegetables/pumpkin.png";
      case FoodType.greenOnion:
        return "assets/icons/vegetables/green-onion.png";
      case FoodType.chives:
        return "assets/icons/vegetables/chives.png";
      case FoodType.lotusRoot:
        return "assets/icons/vegetables/lotus-root.png";
      case FoodType.potato:
        return "assets/icons/vegetables/potato.png";
      case FoodType.mushroom:
        return "assets/icons/vegetables/mushroom.png";
      case FoodType.onionTay:
        return "assets/icons/vegetables/oniontay.png";
      case FoodType.bokChoy:
        return "assets/icons/vegetables/bok-choy.png";
      case FoodType.sprouts:
        return "assets/icons/vegetables/sprouts.png";
      case FoodType.sweetPotato:
        return "assets/icons/vegetables/sweet-potato.png";
      case FoodType.cucumber:
        return "assets/icons/vegetables/cucumber.png";
      case FoodType.taro:
        return "assets/icons/vegetables/taro.png";
      case FoodType.perilla:
        return "assets/icons/vegetables/perilla.png";
      case FoodType.corn:
        return "assets/icons/vegetables/corn.png";
      case FoodType.kohlrabi:
        return "assets/icons/vegetables/kohlrabi.png";
      case FoodType.bingo:
        return "assets/icons/vegetables/bingo.png";
      case FoodType.chili:
        return "assets/icons/vegetables/chili.png";
      case FoodType.bellPepper:
        return "assets/icons/vegetables/bell-pepper.png";
      case FoodType.cauliflower:
        return "assets/icons/vegetables/cauliflower.png";
      case FoodType.broccoli:
        return "assets/icons/vegetables/healthy.png";
      case FoodType.greenBeans:
        return "assets/icons/vegetables/green-beans.png";
      case FoodType.food:
        return "assets/icons/vegetables/food.png";
      case FoodType.zucchini:
        return "assets/icons/vegetables/zucchini.png";
      case FoodType.coriander:
        return "assets/icons/vegetables/coriander.png";
      case FoodType.garlic:
        return "assets/icons/vegetables/garlic.png";
      case FoodType.bitterGourd:
        return "assets/icons/vegetables/bitter-gourd.png";
      case FoodType.basil:
        return "assets/icons/vegetables/basil.png";
      case FoodType.morningGlory:
        return "assets/icons/vegetables/spinach.png";
      case FoodType.spinach1:
        return "assets/icons/vegetables/spinach1.png";
      case FoodType.rauNgot:
        return "assets/icons/vegetables/2.png";
      case FoodType.bamboo:
        return "assets/icons/vegetables/bamboo.png";

      // --- Thịt ---
      case FoodType.porkBelly:
        return "assets/icons/meats/pork.png";
      case FoodType.duck:
        return "assets/icons/meats/peking-duck.png";
      case FoodType.chicken:
        return "assets/icons/meats/roast-chicken.png";
      case FoodType.chickenWings:
        return "assets/icons/meats/chicken-wings.png";
      case FoodType.drumstick:
        return "assets/icons/meats/drumstick.png";
      case FoodType.ham:
        return "assets/icons/meats/ham.png";
      case FoodType.ribs:
        return "assets/icons/meats/ribs.png";
      case FoodType.tenderloin:
        return "assets/icons/meats/tenderloin.png";
      case FoodType.porkLeg:
        return "assets/icons/meats/pork-leg.png";
      case FoodType.beef:
        return "assets/icons/meats/beef.png";
      case FoodType.pig:
        return "assets/icons/meats/pig.png";
      case FoodType.meatProduct:
        return "assets/icons/meats/ham1.png";
      case FoodType.eggs:
        return "assets/icons/meats/eggs.png";
      case FoodType.quailEggs:
        return "assets/icons/meats/eggcut.png";
      case FoodType.tomahawk:
        return "assets/icons/meats/tomahawk.png";

      // --- Hải sản ---
      case FoodType.shrimp:
        return "assets/icons/seafood/shrimp.png";
      case FoodType.fish:
        return "assets/icons/seafood/fish.png";
      case FoodType.eel:
        return "assets/icons/seafood/angler.png";
      case FoodType.crab:
        return "assets/icons/seafood/crab.png";
      case FoodType.snail:
        return "assets/icons/seafood/shell.png";
      case FoodType.clam:
        return "assets/icons/seafood/clam.png";
      case FoodType.mussel:
        return "assets/icons/seafood/she.png";
      case FoodType.mussel:
        return "assets/icons/seafood/mussel.png";
      case FoodType.scallop:
        return "assets/icons/seafood/so.png";
      case FoodType.squid:
        return "assets/icons/seafood/squid.png";
      case FoodType.salmon:
        return "assets/icons/seafood/salmon.png";
      case FoodType.octopus:
        return "assets/icons/seafood/octopus.png";
      case FoodType.roe:
        return "assets/icons/seafood/sushi.png";
      case FoodType.lobster:
        return "assets/icons/seafood/lobster.png";
      case FoodType.jellyfish:
        return "assets/icons/seafood/jellyfish.png";
      case FoodType.snowCrab:
        return "assets/icons/seafood/snow-crab.png";
      case FoodType.seaweed:
        return "assets/icons/seafood/seaweed.png";

      // --- Chế phẩm từ sữa ---
      case FoodType.almondMilk:
        return "assets/icons/dairyMilk/almond-milk.png";
      case FoodType.cheese:
        return "assets/icons/dairyMilk/cheese.png";
      case FoodType.bubbleTea:
        return "assets/icons/dairyMilk/bubble-tea.png";
      case FoodType.burrata:
        return "assets/icons/dairyMilk/burrata.png";
      case FoodType.butter:
        return "assets/icons/dairyMilk/butter.png";
      case FoodType.milk:
        return "assets/icons/dairyMilk/milk.png";
      case FoodType.mozzarella:
        return "assets/icons/dairyMilk/mozzarella.png";
      case FoodType.probi:
        return "assets/icons/dairyMilk/probiotic.png";
      case FoodType.yogurt:
        return "assets/icons/dairyMilk/yogurt.png";
      case FoodType.whippedCream:
        return "assets/icons/dairyMilk/whipped-cream.png";
      case FoodType.cornMilk:
        return "assets/icons/dairyMilk/corn.png";
      case FoodType.lassi:
        return "assets/icons/dairyMilk/lassi.png";

      // --- Đồ uống ---
      case FoodType.coke:
        return "assets/icons/drink/coke.png";
      case FoodType.coffee:
        return "assets/icons/drink/coffee-cup.png";
      case FoodType.orangeJuice:
        return "assets/icons/drink/orange-juice.png";
      case FoodType.lemonade:
        return "assets/icons/drink/lemonade.png";
      case FoodType.coconutDrink:
        return "assets/icons/drink/coconut-drink.png";
      case FoodType.softDrink:
        return "assets/icons/drink/soft-drink.png";
      case FoodType.water:
        return "assets/icons/drink/water-bottle.png";
      case FoodType.energyDrink:
        return "assets/icons/drink/energy-drink.png";
      case FoodType.juice:
        return "assets/icons/drink/juice.png";
      case FoodType.sportDrink:
        return "assets/icons/drink/sport.png";
      case FoodType.tea:
        return "assets/icons/drink/herbal-tea.png";
      case FoodType.bubbleTeaDrink:
        return "assets/icons/drink/bubble-tea.png";
      case FoodType.teaBag:
        return "assets/icons/drink/tea-bag.png";
      case FoodType.gingerTea:
        return "assets/icons/drink/ginger-tea.png";
      case FoodType.hotChocolate:
        return "assets/icons/drink/hot-chocolate.png";
      case FoodType.lemonTea:
        return "assets/icons/drink/lemon-tea.png";

      // --- Đồ uống có cồn ---
      case FoodType.beer:
        return "assets/icons/alcohol/beer.png";
      case FoodType.brandy:
        return "assets/icons/alcohol/brandy.png";
      case FoodType.champagne:
        return "assets/icons/alcohol/champagne.png";
      case FoodType.cocktail:
        return "assets/icons/alcohol/coktail.png";
      case FoodType.herbalLiquor:
        return "assets/icons/alcohol/liqueur-coffee.png";
      case FoodType.rum:
        return "assets/icons/alcohol/rum.png";
      case FoodType.sangria:
        return "assets/icons/alcohol/sangria.png";
      case FoodType.sake:
        return "assets/icons/alcohol/sake.png";
      case FoodType.vodka:
        return "assets/icons/alcohol/vodka.png";
      case FoodType.whiskey:
        return "assets/icons/alcohol/whiskey.png";
      case FoodType.wine:
        return "assets/icons/alcohol/wine-bottle.png";
      case FoodType.soju:
        return "assets/icons/alcohol/soju.png";
      case FoodType.strongbow:
        return "assets/icons/alcohol/drinks.png";

      // --- Nước sốt ---
      case FoodType.hotSauce:
        return "assets/icons/sauce/hot-sauce.png";
      case FoodType.ketchup:
        return "assets/icons/sauce/ketchup.png";
      case FoodType.fishSauce:
        return "assets/icons/sauce/sauce12.png";
      case FoodType.mayonnaise:
        return "assets/icons/sauce/mayonnaise.png";
      case FoodType.mustard:
        return "assets/icons/sauce/mustard.png";
      case FoodType.wasabi:
        return "assets/icons/sauce/wasabi.png";
      case FoodType.soySauce:
        return "assets/icons/sauce/soy-sauce.png";
      case FoodType.tuongBan:
        return "assets/icons/sauce/soy-sauce1.png";
      case FoodType.honey:
        return "assets/icons/sauce/honey.png";
      case FoodType.bbqSauce:
        return "assets/icons/sauce/sauce.png";
      case FoodType.riceVinegar:
        return "assets/icons/sauce/rice-wine.png";
      case FoodType.appleCiderVinegar:
        return "assets/icons/sauce/apple-cider-vinegar.png";
      case FoodType.strawberryJam:
        return "assets/icons/sauce/jam.png";

      // --- Gia vị ---
      case FoodType.salt:
        return "assets/icons/spices/salt.png";
      case FoodType.chiliPowder:
        return "assets/icons/spices/chilli-pepper.png";
      case FoodType.sugar:
        return "assets/icons/spices/sugar.png";
      case FoodType.cinnamon:
        return "assets/icons/spices/cinnamon.png";
      case FoodType.turmeric:
        return "assets/icons/spices/food.png";
      case FoodType.gingerSpice:
        return "assets/icons/spices/ginger.png";
      case FoodType.garlic:
        return "assets/icons/spices/garlic.png";
      case FoodType.lemongrass:
        return "assets/icons/spices/lemongrass.png";
      case FoodType.pepperSpice:
        return "assets/icons/spices/pepper.png";
      case FoodType.sate:
        return "assets/icons/spices/chili-sauce.png";
      case FoodType.seasoning:
        return "assets/icons/spices/salt-and-pepper.png";
      case FoodType.msg:
        return "assets/icons/spices/monosodium-glutamate.png";

      // --- Bánh mì ---
      case FoodType.bagel:
        return "assets/icons/bread/bagel.png";
      case FoodType.bread:
        return "assets/icons/bread/bread.png";
      case FoodType.breadCircle:
        return "assets/icons/bread/bread_circle.png";
      case FoodType.brioche:
        return "assets/icons/bread/brioche.png";
      case FoodType.donut:
        return "assets/icons/bread/donut.png";
      case FoodType.sandwich:
        return "assets/icons/bread/sandwich.png";
      case FoodType.pateBread:
        return "assets/icons/bread/sandwich_1.png";
      case FoodType.pizza:
        return "assets/icons/bread/pizza.png";
      case FoodType.sandwichLoaf:
        return "assets/icons/bread/bread-loaf.png";
      case FoodType.pancake:
        return "assets/icons/bread/pancakes.png";

      // ----- Tráng miệng -----
      case FoodType.sweetSoup:
        return "assets/icons/desserts/tong-sui.png";
      case FoodType.iceCream:
        return "assets/icons/desserts/ice-cream.png";
      case FoodType.cake:
        return "assets/icons/desserts/strawberry-cake.png";
      case FoodType.eggTart:
        return "assets/icons/desserts/egg-tart.png";
      case FoodType.chocolate:
        return "assets/icons/desserts/chocolate.png";
      case FoodType.candy:
        return "assets/icons/desserts/candy.png";
      case FoodType.caramel:
        return "assets/icons/desserts/caramel.png";
      case FoodType.chewingGum:
        return "assets/icons/desserts/chewing-gum.png";
      case FoodType.cookie:
        return "assets/icons/desserts/cookie.png";
      case FoodType.energyBar:
        return "assets/icons/desserts/energy-bar.png";
      case FoodType.pudding:
        return "assets/icons/desserts/caramel-pudding.png";
      case FoodType.swissRoll:
        return "assets/icons/desserts/swiss-roll.png";
      case FoodType.potatoChips:
        return "assets/icons/desserts/potato-chips.png";
      case FoodType.snack:
        return "assets/icons/desserts/snack.png";
      case FoodType.moonCake:
        return "assets/icons/desserts/moon-cake.png";

      // ----- Quả hạch -----
      case FoodType.pumpkinSeed:
        return "assets/icons/nuts/snack.png";
      case FoodType.sunflowerSeed:
        return "assets/icons/nuts/sunflower-seed.png";
      case FoodType.cashew:
        return "assets/icons/nuts/cashew.png";
      case FoodType.walnut:
        return "assets/icons/nuts/nut.png";
      case FoodType.almond:
        return "assets/icons/nuts/almond.png";
      case FoodType.chestnut:
        return "assets/icons/nuts/chestnut.png";
      case FoodType.macadamia:
        return "assets/icons/nuts/macadamia.png";
      case FoodType.peanut:
        return "assets/icons/nuts/peanuts.png";
      case FoodType.soybean:
        return "assets/icons/nuts/healthy.png";
      case FoodType.lotusSeed:
        return "assets/icons/nuts/lotus.png";
      case FoodType.pistachio:
        return "assets/icons/nuts/pistachio.png";
      case FoodType.cacao:
        return "assets/icons/nuts/cacao.png";

      // ----- Ngũ cốc -----
      case FoodType.rice:
        return "assets/icons/grains/rice.png";
      case FoodType.blackBean:
        return "assets/icons/grains/beans.png";
      case FoodType.redBean:
        return "assets/icons/grains/red-beans.png";
      case FoodType.oat:
        return "assets/icons/grains/cereal.png";
      case FoodType.millet:
        return "assets/icons/grains/millet.png";
      case FoodType.barley:
        return "assets/icons/grains/bag.png";
      case FoodType.brownRice:
        return "assets/icons/grains/brown-rice.png";
      case FoodType.cornHat:
        return "assets/icons/grains/cornHat.png";

      // ----- Default -----
      case FoodType.unknown:
      default:
        return "assets/icons/category/food.png";
    }
  }

  // Hàm tiện lợi: từ tên → icon
  static String getIconByName(String name) {
    final type = getFoodType(name);
    return getIcon(type);
  }
}
