# Flutter layouts
## Верстка макетов

__Цель работы:__

Освоить основы компановки виджетов Flutter на практике, сверстать макеты из Figma.

__Ход работы:__ 

_Макет №1._
В макете используются виджеты __Scuffold__, __Column__, __Text__, __Image__, __Expanded__, __Padding__, __ElevatedButton__, __InkWell__.
Элементы располагаются в __Scuffold__ > __Column(Children: [])__, к Scuffold применяется параметр _backgroundColor_. Логотип "Medinow" изображен при помощи виджета __Image__ в виде .png файла. Далее идет виджет __Text__, при помощи которого расположен текст со шрифтом _plusJakartaSans_. Шрифт подключен при помощи библиотеки _google_fonts.dart_, которая позволяет добавлять любые шрифты из коллекции Google Fonts. При помощи элемента __ElevatedButton__ изображены кнопки, дочерними элементами которых является виджет __Text__. Кликабельная надпись под кнопками реализована при помощи виджета __InkWell__. Заключительное изображение реализовано при помощи виджета __Image__.

![Screen1](https://user-images.githubusercontent.com/59766395/192161581-aaa87fe6-6869-4b06-aeb8-09781cd6e1e6.png)




_Макет №2._
В макете используются виджеты __Scuffold__, __Column__, __Container__, __ConstrainedBox__, __Text__, __Image__, __Expanded__, __Padding__, __ElevatedButton__, __Row__.
Визуальные элеементы также расположены в __Scuffold__ > __Column(Children: [])__. Изображение визуализировано при помощи виджета __Container__ с соответствующим атрибутом _decoration: BoxDecoration(color: ..._ и дочерним виджетом __Image__. Далее следуют три виджета __Padding__, которые обеспечивают корректные отступы для дочернего виджета __Text__. Строчные блоки реализованы при помощи виджета __Row__, в котором располагается виджеты __ElevatedButton__ c дочерним элементом __Image__ для изображения иконки, два блока виджета __Text__, обернутых в виджет __Row__ для последовательного их расположения по вертикали, __Expanded__, обеспечивающий заполнение свободного пространства и __ElevatedButton__, дочерним элементом которого служит виджет __Text__.

![Screen2](https://user-images.githubusercontent.com/59766395/192164500-c7678aea-0259-4107-90e5-e96340b6f22f.png)




_Макет №3._
В макете используются виджеты __Scuffold__, __Column__, __Container__, __SizedBox__, __Text__, __Image__, __Expanded__, __Padding__, __ElevatedButton__, __ConstrainedBox__, __Row__, __TextField__, __SingleChildScrollView__, __ListView__, __Stack__.
Панель поиска реализована при помощи виджета __TextField__ c параметром _decoration: InputDecoration(hintText: "Meditate")_, использован __Expanded__ и виджет __ElevatedButton__ с дочерним элементом __Image__. Далее идет виджет __ListView__ с горизонтальной ориентацией для изображения меню. Каждый элемент меню представляет собой виджет __ElevatedButton__, размер которого адаптируется под дочерний элемент __Text__. Далее следует блок, представляющий из себя __Container__, который содержит изображение, которое визуализировано при помощи виджета __Container__ с соответствующим атрибутом _decoration: BoxDecoration(color: ..._ и дочерним виджетом __Image__. При помощи виджета __Column__ расположены элементы __Text__, после чего следует __Row__, включающий в себя __Image__, __Text__, __Expanded__ и __ElevatedButton__, дочерним элементом которого является виджет __Row__, который включает в себя виджеты __Text__ и __Image__. Весь контейнер с элементами данного блока имеет параметр _decoration: BoxDecoration(boxShadow: [BoxShadow(...)]),..._ для обеспечения визуализации тени контейнера. Далее следует два виджета __Row__, каждый из которых включает в себя два блока, реализованных первоначально. Сегмент с большим блоком и двумя строками обернут виджетом __Column__. Для реализации "скролла" используется элемент __SingleChildScrollView__, включающий в себя __Stack__, состоящий из колонки блоков и верхнего меню. Таким образом, при прокрутке колонки блочного сектора, верхнее меню наслаивается поверх колонки. 

![Screen3(1)](https://user-images.githubusercontent.com/59766395/192164851-4eb00c10-2a29-4b05-9f7d-4137a42c9166.png)

![Screen3(2)](https://user-images.githubusercontent.com/59766395/192164903-039a33e1-4e67-4e70-a109-2cf472ae81ca.png)
