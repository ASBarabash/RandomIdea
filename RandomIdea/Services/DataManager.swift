//
//  DataManager.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 02.05.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    let icon = ["🤪", "🍽", "👩🏻‍🏫", "👫🏻", "📝"]
    
    let title = [
        "Развлечения",
        "Кулинария",
        "Образование",
        "Для компании",
        "Мой список"
    ]
    
    let recreational = [
        "Учись писать неведущей рукой",
        "Сходи в спортзал",
        "Посмотри сериал",
        "Сходи на прогулку",
        "Прими ванну с пеной",
        "Пригласи друзей на вечер игр",
        "Напиши другу, с которым давно не разговаривал",
        "Сходи на концерт с друзьями",
        "Устрой пикник с друзьями",
        "Совершите спонтанное путешествие с друзьями",
        "Сходи в кинотеатр",
        "Сходи в караоке с друзьями",
        "Погуляй в парке",
        "Посмотри фильм",
        "Нарисуй первое, что увидишь",
        "Собери кубик Рубика",
        "Займись йогой",
        "Послушай новый музыкальный жанр",
        "Потрать свое время на просмотр этого приложения и в конечном итоге ничего не сделайте",
        "Сиди и смотри в потолок",
        "Разгадай кроссворд",
        "Танцуй и пой песню",
        "Танцуй под любимую песню перед зеркалом",
        "Покатайся на скейте",
        "Сделай уборку дома",
        "Сходи в музей или картинную галерею",
        "Сходи на пробежку по парку с другом(подругой)",
        "Сыграй в компьютерную игру по сети",
        "Устройте фотосессию",
        "Слушай музыку лежа, полностью расслабившись и отрешившись",
        "Сходи в кофейню",
        "Сегодня у кого-то День Рождения - не упусти шанс поздравить",
        "Обнови стержни всех своих ручек",
        "Прослушай все симфонии Гайдна",
        "Покатайся на параплане",
        "Встреть рассвет на вершине горы",
        "Покатайся в аэродинамической трубе",
        "Поплавай с дельфинами",
        "Сядь на скамейку, забудь о всех заботах и наслаждайся",
        "Нарисуй кота",
        "Съешь шоколадку",
        "Похвали близкого человека",
        "Брось все и уедь туда, куда хочется",
        "Просто улыбнись",
        "Прыгни с парашютом",
        "Запусти воздушного змея",
        "Потрать определенную сумму денег на хобби",
        "Запусти небесный фонарик",
        "Купи щенка",
        "Купи котенка",
        "Купи 10 воздушных шариков, свяжи их, прикрепи к ним бумажку с желанием и отправь в небо",
        "В течении часа познакомься с новым человеком",
        "Сделай напиток дорогому человеку",
        "Купи розу и подари первой понравившейся девушке",
        "Покорми голубей",
        "Помедитируй",
        "Найди первого попавшегося кота и погладь его",
        "Прогуляйся 20 минут",
        "Оставь хороший отзыв об этом приложении 😊",
        "Напиши 10 мест, где хочешь побывать",
        "Посмотри арт-хаус фильм",
        "Погладь панду",
        "Займись квилингом",
        "Создай пластилиновый мультик",
        "Займись оулингом",
        "Выучи 5 анекдотов, которые тебе всегда пригодятся на любой вечеринке",
        "Попрыгай со скакалкой",
        "Посмотри концерт любимой группы",
        "Почисти галерею в телефоне",
        "Посмотри, сколько самолетов сейчас в небе",
        "Отвези свои ненужные вещи нуждающимся",
        "Почитай гороскоп",
        "Удали ненужные приложения",
        "Посмотри комедию",
        "Повтори один день из детства",
        "Посмотри мультфильм",
        "Надувай пузыри из жвачки",
        "Посети ботанический сад",
        "Покатайся на электросамокате",
        "Посети филармонию",
        "Пофотографируй пейзаж",
        "Сходи в спа-салон",
        "Покатайся на вейке",
        "Закажи суши",
        "Посети краеведческий музей",
        "Сыграй в дартс",
        "Погуляй под дождем",
        "Закажи пиццу",
        "Построй замок из песка",
        "Сними музыкальный клип",
        "Создай свой логотип",
        "Потанцуй на улице в наушниках",
        "Порисуй на природе",
        "Посмотри чей-нибудь стрим",
        "Раскрась картину по номерам",
        "Посмотри современные мультфильмы",
        "Посмотри фильм на иностранном языке",
        "Закажи другу пиццу",
        "Пройди тест на IQ"
        
    ]
    
    let cooking = [
        "Создай кулинарную книгу с любимыми рецептами",
        "Испеки пирожки себе и своему другу",
        "Составь план питания на ближайшую неделю",
        "Научись печь хлеб",
        "Сделай мороженое",
        "Испеки торт",
        "Сделай бутерброд",
        "Съешь что-нибудь 😊",
        "Испеки шарлотку",
        "Сделай овощной салат",
        "Съешь банан",
        "Сделай себе горячий шоколад",
        "Свари сгущенку",
        "Приготовь самую вкусную шаурму",
        "Приготовь итальянскую пасту",
        "Съешь сладкую вату",
        "Приготовь суп том ям",
        "Приготовь картофель фри",
        "Приготовь хачапури",
        "Приготовь чурчхелу",
        "Приготовь пахлаву",
        "Испеки блины",
        "Приготовь стейк из мраморной говядины",
        "Приготовь борщ",
        "Сделай вкусный лёд",
        "Приготовь профитроли",
        "Сделай безалкогольный яблочный сидр",
        "Приготовь попкорн",
        "Приготовь лимонад",
        "Приготовь клюквенный пунш"
        
    ]
    
    let education = [
        "Напиши стихотворение",
        "Изучай иностранный язык",
        "Узнай, как сделать сайт",
        "Научись приветствовать кого-то на новом языке",
        "Научись писать неведущей рукой",
        "Научись складывать журавлика из бумаги",
        "Изучай каллиграфию",
        "Научись приветствовать кого-то на новом языке",
        "Исследуй интересующую тебя тему",
        "Выучи азбуку Морзе",
        "Научись свистеть пальцами",
        "Научись пришивать пуговицу",
        "Изучай язык программирования",
        "Узнай, как работает интернет",
        "Научись кататься на коньках или роликах",
        "Научись кататься на сноуборде",
        "Научись играть на гитаре",
        "Напиши рассказ",
        "Зайди на сайт Википедии, полазь по страницам, исправляй грамматические ошибки",
        "Научись играть на музыкальном инструменте",
        "Придумай и начни свой проект",
        "Порешай японские кроссворды",
        "Порешай судоку",
        "Поиграй в шахматы(научись, если не умеешь)",
        "Напиши приложение для телефона",
        "Покатайтесь на лыжах",
        "Научись вязать",
        "Выучи танец по видео",
        "Узнай, почему картина «Бурлаки на Волге» вызвала скандал",
        "Запишись на обучающий курс первой помощи",
        "Научись лунной походке",
        "Изучи логотипы автомобильных марок",
        "Выучи валюты стран мира",
        "Научись ставить палатку",
        "Вспомни 3 картины Айвазовского",
        "Посчитай демографическую статистику России",
        "Узнай об исчезающих видах животных",
        "Узнай, в чем смысл «Черного квадрата» Малевича",
        "Научи кого-нибудь новому навыку",
        "Выучи несколько фраз на языке жестов",
        "Научись жонглировать",
        "Научись расставлять приоритеты",
        "Попробуй себя в живописи"
        
    ]
    
    let company = [
        "Играйте в карты",
        "Сходите в кинотеатр",
        "Запланируйте путешествие",
        "Устройте совместный ужин",
        "Сходите в боулинг",
        "Устройте пикник на природе",
        "Играйте в мафию",
        "Погуляйте в парке",
        "Съездите на ипподром и покатайтесь на лошадях",
        "Отправьтесь в путешествие с палатками",
        "Сыграйте в нарды",
        "Покатайтесь на картингах",
        "Поиграйте в командную игру на свежем воздухе",
        "Поиграйте в пейнтбол",
        "Займитесь йогой",
        "Сходите в аквапарк",
        "Сходите в музей или картинную галерею",
        "Посетите приют для животных",
        "Ничего не делайте 😁",
        "Организуйте выезд на природу на велосипедах",
        "Отправьтесь загорать на пляж",
        "Сходите попариться в сауну",
        "Сходите в тир",
        "Слепите снеговика",
        "Устройте вечернику",
        "Покатайтесь на снегоходах",
        "Устройте бой подушками",
        "Сходите в караоке",
        "Забронируйте домик на выходные",
        "Прокатитесь на колесе обозрения",
        "Покормите уток на водоеме",
        "Устройте чайную церемонию",
        "Запишите видео для социальной сети",
        "Сыграйте в покер",
        "Сходите в дельфинарий",
        "Поиграйте в приставку",
        "Сходите в зоопарк",
        "Сходите в планетарий",
        "Поиграйте в Камень, ножницы, бумага",
        "Сыграйте в лото",
        "Устройте конкурс по прыжкам в длину",
        "Сходите в цирк",
        "Поиграйте в Угадай мелодию",
        "Поиграйте в «Кто дольше без смартфона»"
        
    ]
    
    private init() {}
}
