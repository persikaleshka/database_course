CREATE TABLE "меню" (
  "id" int PRIMARY KEY,
  "id_ресторана" int,
  "название_блюда" varchar,
  "цена" int,
  "описание" text
);

CREATE TABLE "пользователь" (
  "id" int PRIMARY KEY,
  "имя" varchar,
  "телефон" varchar,
  "адрес" text,
  "способ_оплаты" varchar
);

CREATE TABLE "курьер" (
  "id" int PRIMARY KEY,
  "имя" varchar,
  "телефон" varchar,
  "адрес" text,
  "статус" varchar
);

CREATE TABLE "ресторан" (
  "id" int PRIMARY KEY,
  "название" varchar,
  "адрес" text,
  "телефон" varchar,
  "сайт" varchar
);

CREATE TABLE "заказ" (
  "id" int PRIMARY KEY,
  "id_пользователя" int,
  "id_ресторана" int,
  "стоимость" int,
  "статус" varchar,
  "время_создания" time
);

CREATE TABLE "доставка" (
  "id" int PRIMARY KEY,
  "id_заказа" int,
  "id_курьер" int,
  "адрес_пользователя" varchar,
  "статус" varchar,
  "время_доставки" time
);

CREATE TABLE "оплата" (
  "id" int PRIMARY KEY,
  "id_заказа" int,
  "способ_оплаты" varchar,
  "сумма" int,
  "статус" varchar
);

CREATE TABLE "позиции_заказа" (
  "id" int PRIMARY KEY,
  "id_меню" int,
  "id_заказа" int,
  "количество" int,
  "цена" int,
  "статус" varchar
);

ALTER TABLE "ресторан" ADD FOREIGN KEY ("id") REFERENCES "заказ" ("id_ресторана");

ALTER TABLE "пользователь" ADD FOREIGN KEY ("id") REFERENCES "заказ" ("id_пользователя");

ALTER TABLE "ресторан" ADD FOREIGN KEY ("id") REFERENCES "меню" ("id_ресторана");

ALTER TABLE "заказ" ADD FOREIGN KEY ("id") REFERENCES "доставка" ("id_заказа");

ALTER TABLE "заказ" ADD FOREIGN KEY ("id") REFERENCES "оплата" ("id_заказа");

ALTER TABLE "курьер" ADD FOREIGN KEY ("id") REFERENCES "доставка" ("id_курьер");

ALTER TABLE "заказ" ADD FOREIGN KEY ("id") REFERENCES "позиции_заказа" ("id_заказа");

ALTER TABLE "меню" ADD FOREIGN KEY ("id") REFERENCES "позиции_заказа" ("id_меню");

ALTER TABLE "пользователь" ADD FOREIGN KEY ("способ_оплаты") REFERENCES "оплата" ("способ_оплаты");

ALTER TABLE "пользователь" ADD FOREIGN KEY ("адрес") REFERENCES "доставка" ("адрес_пользователя");
