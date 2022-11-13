# Flutter SQFLite
## Работа с БД SQLite

__Цель работы:__

Реализовать функции инициализации базы данных для всех платформ, создания, обновления и заполнения таблиц данными, удаления базы данных. Реализовать таблицы для предметной области "Склад", используя базу данных SQLite.

__Ход работы:__ 

_Модель БД_

Для проектирования базы данных необходимо реализовать инфологическую ER-модель:

![image](https://user-images.githubusercontent.com/59766395/201523642-96945447-f3e4-4bb4-b217-9d8778b0f5a3.png)

_Подключение зависимостей_

Для работы как с мобильной базой данных, так и настольной, необходимо подключить следующие библиотеки:

<img width="270" alt="Снимок экрана 2022-11-13 164323" src="https://user-images.githubusercontent.com/59766395/201524889-51b8e5ef-4a43-4f2c-8487-f268844679f6.png">

_DataBaseRequest_

Основные запросы к БД и список таблиц реализваны в классе __DataBaseRequest__:

<img width="728" alt="Снимок экрана 2022-11-13 164634" src="https://user-images.githubusercontent.com/59766395/201525038-ee1613fa-e3d7-4959-a35c-b8538b31df8b.png">

_TableModels_

Для корректного получения и отправки данных при запросах в БД реализованы модели для каждой таблицы:

<img width="200" alt="Снимок экрана 2022-11-13 165358" src="https://user-images.githubusercontent.com/59766395/201525418-d1515f58-bfe5-4007-81ba-5f6fea27ae4b.png">

_AdmissionModel_

Пример модели таблицы поступления товара __(Admission table)__:

<img width="351" alt="Снимок экрана 2022-11-13 165257" src="https://user-images.githubusercontent.com/59766395/201525362-726c1bbc-4505-422d-b415-9ab7a286595a.png">

_TableEntities_

Для каждой таблицы реализован файл сущности:

<img width="151" alt="Снимок экрана 2022-11-13 165733" src="https://user-images.githubusercontent.com/59766395/201525574-c3c40aad-7645-4f28-8ca8-e641e52c1d61.png">

_AdmissionEntity_

Пример сущности таблицы поступления товара __(Admission table)__:

<img width="378" alt="Снимок экрана 2022-11-13 170012" src="https://user-images.githubusercontent.com/59766395/201525699-1d580a4f-68cc-4cfe-8a4c-263331737bc1.png">

_DataBaseHelper_

Функционал для работы с БД реализован в классе __(DataBaseHelper)__. В данном классе описаны функции инициализации базы, редактирования, добавления и удаления БД:

<img width="340" alt="Снимок экрана 2022-11-13 170407" src="https://user-images.githubusercontent.com/59766395/201525949-24ca83b2-3e09-4753-a2cb-bb141e4b1e05.png">
<img width="343" alt="Снимок экрана 2022-11-13 170530" src="https://user-images.githubusercontent.com/59766395/201525958-c64125a2-6a92-4a34-a3ed-91d7721eb5b7.png">

_Заполнение данными в DataBaseHelper_

В этом же классе описана функция добавления новых данных в таблицы базы:

<img width="697" alt="Снимок экрана 2022-11-13 170716" src="https://user-images.githubusercontent.com/59766395/201526035-a4832782-5e3e-4125-be8a-d2904ed28079.png">

_Результат работы_

Для удобного отображения данных было использовано расширение __SQLite__.:

<img width="174" alt="Снимок экрана 2022-11-13 170935" src="https://user-images.githubusercontent.com/59766395/201526115-466d7a15-34db-4d43-8e1b-aa6874f34840.png">

_Отображение данных_

Примеры заполненных таблиц базы:

<img width="358" alt="Снимок экрана 2022-11-13 171222" src="https://user-images.githubusercontent.com/59766395/201526259-c0ca79ec-138d-40c0-aeb7-3925e9a406b1.png">
<img width="403" alt="Снимок экрана 2022-11-13 171249" src="https://user-images.githubusercontent.com/59766395/201526276-9bac9ad4-6369-4eea-a696-d181e6dbbaf4.png">


__Вывод:__

В ходе практической работы были реализованы функции инициализации базы данных для всех платформ, создания, обновления и заполнения таблиц данными, удаления базы данных, реализованы таблицы для предметной области "Склад", используя базу данных SQLite.
