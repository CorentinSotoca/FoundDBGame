DROP TABLE IF EXISTS message, equipment, mission, agent, donnees;

CREATE TABLE donnees (id_agent Integer, name varchar, surname varchar, gender char(1), birthdate date, grade varchar, status varchar, id_mission Integer, action_date date, id_stuff Integer, stuff_name varchar, id_message Integer, object varchar, date_of_dispatch date, addressee Integer, content text); 

\copy donnees from message.txt delimiter ',' csv;

CREATE TABLE agent (
    id_agent Integer,
    name varchar,
    surname varchar,
    gender char(1),
    birthdate date,
    grade varchar,
    status varchar, 
    CONSTRAINT pk_agent PRIMARY KEY(id_agent)
);

CREATE TABLE mission (
    id_mission Integer,
    action_date date,
    agent Integer
);

CREATE TABLE equipment (
    id_stuff Integer,
    stuff_name varchar,
    belong_to Integer,
    CONSTRAINT fk_agent_equipment FOREIGN KEY(belong_to)
    REFERENCES agent(id_agent)
);

CREATE TABLE message (
    id_message Integer,
    object varchar,
    date_of_dispatch date,
    sender Integer,
    addressee Integer,
    content varchar,
    CONSTRAINT pk_message PRIMARY KEY(id_message),
    CONSTRAINT fk_agent_message1 FOREIGN KEY(sender)
    REFERENCES agent(id_agent),
    CONSTRAINT fk_agent_message2 FOREIGN KEY(addressee)
    REFERENCES agent(id_agent)
); 


INSERT INTO agent (id_agent, name, surname, gender, birthdate, grade, status) SELECT distinct id_agent, name, surname, gender, birthdate, grade, status FROM donnees;
INSERT INTO mission (id_mission, action_date, agent) SELECT distinct id_mission , action_date, id_agent FROM donnees;
INSERT INTO equipment (id_stuff, stuff_name, belong_to) SELECT distinct id_stuff, stuff_name, id_agent FROM donnees WHERE id_stuff IS NOT null;
INSERT INTO message (id_message, object, date_of_dispatch, sender, addressee, content) SELECT distinct id_message, object, date_of_dispatch, id_agent, addressee, content FROM donnees WHERE id_message IS NOT null;

INSERT INTO message (id_message, object, date_of_dispatch, sender, addressee, content) VALUES (10, 'Object', '20/05/2021', 563, 531, '注释：　山郭：靠山的城郭。南朝：我国历史上晋朝后的宋、齐、梁、和陈四个朝代的合称。佛教传入我国后，在南北朝时期待到广泛地传播，到处兴建寺庙。');
INSERT INTO message (id_message, object, date_of_dispatch, sender, addressee, content) VALUES (11, 'Mission', '22/05/2021', 713, 531, 'Bonjour 531, attention à toi dans les prochains jours il y a des mouvements suspects chez tu sais qui. On se voit bientôt, 713.');
INSERT INTO message (id_message, object, date_of_dispatch, sender, addressee, content) VALUES (9, '靠', '20/05/2022', 563, 531, '注释：　注释：　人面：第一个是指姑娘的脸，第二个是代指姑娘本人');
INSERT INTO message (id_message, object, date_of_dispatch, sender, addressee, content) VALUES (13, 'Hey', '16/08/2021', 373, 531, 'Hey 531, I m glad to begin my last misision tommorow. Afetr that I will go in vacation with my wife and maybe buit a family wth her. You were a great friend and I will never forget you ! Bye my dear 531 !');
INSERT INTO message (id_message, object, date_of_dispatch, sender, addressee, content) VALUES (12, 'Pain', '15/01/2022', 351, 531, '译文：　去年的今天，就在这个庭院的门里，我看到姑娘那美丽的脸庞和粉红的桃花相互映衬。到如今却不知道这姑娘到哪儿去了，只有这朵朵的桃花依旧在春风中绽开笑脸。');
INSERT INTO message (id_message, object, date_of_dispatch, sender, addressee, content) VALUES (8, 'Lait', '20/05/2021', 721, 531, '译文：　春到江南处处黄莺啼鸣、叶绿花红，水边的村庄、山旁的城郭酒旗迎风飘扬。南朝时修筑得那么多的寺庙和楼阁，都笼罩在蒙蒙的烟雨之中。');
INSERT INTO message (id_message, object, date_of_dispatch, sender, addressee, content) VALUES (1, 'Arcade', '02/03/2022', 368, 531, 'Bonjour Agent, votre nouvel mission consiste à infiltrer la nouvelle salle d arcade ouverte la semaine dernière qui est tenue par la mafia. Attention à vous l ennemi s attend à notre visite. Bonne chance 531.');
INSERT INTO message (id_message, object, date_of_dispatch, sender, addressee, content) VALUES (7, 'Re:Re:Pain', '10/02/2021', 351, 531, '注释：　遥：远。川：河。飞流：飞泻下的水流。直下：直泻而下。疑：怀疑。银河：天河。落：倾泻，泻落。');
INSERT INTO message (id_message, object, date_of_dispatch, sender, addressee, content) VALUES (20, 'Marsupilami', '08/03/2022', 393, 531, 'Le marsupilami est un animal très rare. Il a un pelage jaune et noir et est très intelligent. Le marsupilami se défend principalement avec sa queue. Il devra affronter des chasseurs qui rêvent de le capturer tout en protégeant sa famille.');
INSERT INTO message (id_message, object, date_of_dispatch, sender, addressee, content) VALUES (6, 'Xiaomi', '20/04/2022', 675, 531, 'Xiaomi peut utiliser des cookies internes et tiers pour maintenir les fonctionnalités essentielles de notre site web et observer les performances du site afin de nous aider à améliorer la qualité de notre site, de nos produits, des services en ligne proposés, ainsi qu à améliorer votre expérience en fournissant un contenu personnalisé et des publicités adaptées.');
INSERT INTO message (id_message, object, date_of_dispatch, sender, addressee, content) VALUES (2, 'GP Is Dead', '26/07/2020', 478, 531, 'Hey ! I m sad to tell you that GP died during his last mission last week. He was killed by the mafia, they claimed his kill. Take care of you and see you at your funeral.');
INSERT INTO message (id_message, object, date_of_dispatch, sender, addressee, content) VALUES (18, '666', '20/05/2021', 643, 531, 'Crux sacra sit mihi lux Non draco sit mihi dux Vade retro satana Numquam suade mihi vana Sunt mala quae libas Ipse venena bibas ');

INSERT INTO mission (id_mission, action_date, agent) VALUES ('1', '21/05/2022', 563);
INSERT INTO mission (id_mission, action_date, agent) VALUES ('11', '21/05/2022', 721);
INSERT INTO mission (id_mission, action_date, agent) VALUES ('16', '21/05/2022', 478);
INSERT INTO mission (id_mission, action_date, agent) VALUES ('12', '21/05/2022', 713);
INSERT INTO mission (id_mission, action_date, agent) VALUES ('7', '21/05/2022', 373);
INSERT INTO mission (id_mission, action_date, agent) VALUES ('8', '21/05/2022', 643);
INSERT INTO mission (id_mission, action_date, agent) VALUES ('1', '21/05/2022', 393);


INSERT INTO agent(id_agent, name, surname, gender, birthdate, grade, status) VALUES (132,'菲利普','马修','M', '21/08/1996','BG', 'OPERATIONAL');
INSERT INTO agent(id_agent, name, surname, gender, birthdate, grade, status) VALUES (146,'菲利','马修','M', '21/08/1996','XD','OPERATIONAL');
INSERT INTO equipment(id_stuff, stuff_name, belong_to) VALUES(155,'truck',132);
