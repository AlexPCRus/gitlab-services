#Область СлужебныйПрограммныйИнтерфейс

// @unit-test
Процедура Тест_СтруктураОтвета(Фреймворк) Экспорт

	Результат = РаботаСИнтернетСервисами.СтруктураОтвета();
	Фреймворк.ПроверитьРавенство(Результат.Количество(), 2);
	Фреймворк.ПроверитьИстину(Результат.Свойство("type"));
	Фреймворк.ПроверитьИстину(Результат.Свойство("message"));
	
КонецПроцедуры

// TODO перепроверить, возможно уже не нужная процедура
// @unit-test
Процедура Тест_МетодТелоHTTPОтветаВКоллекциюКакJSON(Фреймворк) Экспорт

	ЭталонJSON = "{
				 |""Ключ1"": ""Значение1""
				 |}";
	ЭталонКоллекция = Новый Структура("Ключ1", "Значение1");

	Ответ = Новый HTTPСервисОтвет(200);
	Ответ.УстановитьТелоИзСтроки( ЭталонJSON);

	Коллекция1 = Неопределено;
	РаботаСИнтернетСервисами.ТелоHTTPОтветаВКоллекциюКакJSON( Ответ, Истина, Ложь, Коллекция1);

	Коллекция2 = Неопределено;
	РаботаСИнтернетСервисами.ТелоHTTPОтветаВКоллекциюКакJSON( Ответ, Ложь, Ложь, Коллекция2);

	Коллекция3 = Неопределено;
	РаботаСИнтернетСервисами.ТелоHTTPОтветаВКоллекциюКакJSON( Ответ, Истина, Истина, Коллекция3);

	Фреймворк.ПроверитьТип( Коллекция1, "Соответствие");
	Фреймворк.ПроверитьТип( Коллекция2, "Структура");

	Фреймворк.ПроверитьРавенство( Коллекция1.Количество(), 1);
	Фреймворк.ПроверитьРавенство( Коллекция2.Количество(), 1);
	Фреймворк.ПроверитьРавенство( Коллекция3.Количество(), 2);

	Фреймворк.ПроверитьРавенство( ЭталонКоллекция.Ключ1, Коллекция1.Получить("Ключ1"));
	Фреймворк.ПроверитьРавенство( ЭталонКоллекция.Ключ1, Коллекция2.Ключ1);
	Фреймворк.ПроверитьРавенство( ЭталонJSON, Коллекция3.Получить("json"));

КонецПроцедуры

#Область ВспомогательныеПроцедурыИФункции

Функция ПолучитьОписаниеСервисаURL(Знач URL) Экспорт

	Возврат РаботаСИнтернетСервисами.ПолучитьОписаниеСервисаURL(URL);

КонецФункции

Функция ПолучитьОписаниеСервиса(Знач Сервис) Экспорт

	Возврат РаботаСИнтернетСервисами.ПолучитьОписаниеСервиса(Сервис);

КонецФункции

Функция ПолучитьЗагружатьФайлыИзВнешнегоХранилища() Экспорт

	Возврат Константы.ЗагружатьФайлыИзВнешнегоХранилища.Получить();

КонецФункции

Процедура УстановитьЗагружатьФайлыИзВнешнегоХранилища(Знач Значение) Экспорт

	Константы.ЗагружатьФайлыИзВнешнегоХранилища.Установить(Значение);

КонецПроцедуры

#КонецОбласти

#КонецОбласти