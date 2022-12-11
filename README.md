# SharedPreferences, arguments passing
## Работа с библиотекой SharedPreferences, передача данных в аргументы

__Цель работы:__

Реализовать восстановление данных после закрытия приложения. Если есть данные в SharedPrefrences открыть 2 экран, если данных нет то открыть 1 экран. Так же реализовать восстановление темы приложения.


__Ход работы:__ 

Подключение зависимостей для работы с библиотекой _SharedPrefrences_ и _flutterBloc_:

<img width="188" alt="image" src="https://user-images.githubusercontent.com/59766395/206910475-429180bc-2835-45c8-a4ae-54f91b43ac05.png">


Реализация переключения темы при помощи _Cubit_:

<img width="383" alt="image" src="https://user-images.githubusercontent.com/59766395/206910589-c49ba262-4056-4cb3-8b6e-e1b20c728d08.png">

<img width="283" alt="image" src="https://user-images.githubusercontent.com/59766395/206910570-a18044d9-5121-4123-8844-1bbb221a9ce7.png">


Проверяем сохраненные данные при инициализации - в случае наличия сохраненного текста вызываем другое окно и передаем сохраненные данные:

<img width="383" alt="image" src="https://user-images.githubusercontent.com/59766395/206910875-3f7f9f60-474d-4769-a0f7-0079d1565743.png">


При вводе текста в основном окне и нажатии на кнопку происходит сохранение строки и текущей темы, после чего вызываем другое окно:

<img width="441" alt="image" src="https://user-images.githubusercontent.com/59766395/206911075-3e5897a7-a6a0-48b6-bee2-d59851c013fe.png">


Вызываемое окно запрашивает параметры текста и темы:

<img width="403" alt="image" src="https://user-images.githubusercontent.com/59766395/206911162-ffccff9a-42c7-42f4-97f1-85a9c541631b.png">


Задаем полученную тему и текст:

<img width="405" alt="image" src="https://user-images.githubusercontent.com/59766395/206911300-08b2e2ff-8f5f-4df0-83e4-6177e8edf085.png">


Первое окно:

<img width="494" alt="image" src="https://user-images.githubusercontent.com/59766395/206911631-9de03652-8c62-4a66-86f9-5c192be896e8.png">


Второе окно:

<img width="494" alt="image" src="https://user-images.githubusercontent.com/59766395/206911644-5a9e1484-b3c0-48c5-9ea0-06e9730b0a29.png">


__Вывод:__

В ходе практической работы было реализовано восстановление данных после закрытия приложения, в условиях сохраненного текста происходит открытие второго экрана, на котором отображен сохраненный текст и задана сохраненная тема первого экрана.
