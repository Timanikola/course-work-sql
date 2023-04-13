-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 13 2023 г., 06:08
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `travel_agency`
--

-- --------------------------------------------------------

--
-- Структура таблицы `excursions`
--

CREATE TABLE `excursions` (
  `ID` int(11) NOT NULL,
  `name_excursions` varchar(50) DEFAULT NULL,
  `date_excursionz` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `excursions`
--

INSERT INTO `excursions` (`ID`, `name_excursions`, `date_excursionz`) VALUES
(1, 'Поездка на байканур', '2023-03-20');

-- --------------------------------------------------------

--
-- Структура таблицы `hotels`
--

CREATE TABLE `hotels` (
  `ID` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `hotels`
--

INSERT INTO `hotels` (`ID`, `title`) VALUES
(1, 'Angora-hotel'),
(2, 'Pendik-hotel');

-- --------------------------------------------------------

--
-- Структура таблицы `numbers`
--

CREATE TABLE `numbers` (
  `ID` int(11) NOT NULL,
  `№_number` int(5) DEFAULT NULL,
  `id_hotel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `numbers`
--

INSERT INTO `numbers` (`ID`, `№_number`, `id_hotel`) VALUES
(1, 404, 1),
(2, 505, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `tour`
--

CREATE TABLE `tour` (
  `ID` int(11) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `excursions` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `tour`
--

INSERT INTO `tour` (`ID`, `country`, `number`, `excursions`) VALUES
(1, 'казахстан', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `tourist`
--

CREATE TABLE `tourist` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `patronymic` varchar(50) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `old` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `tourist`
--

INSERT INTO `tourist` (`id`, `name`, `surname`, `patronymic`, `gender`, `old`) VALUES
(1, 'Тимофей', 'Николаев', 'Георгиевич', 1, '20'),
(2, 'Иван', 'Иванов', 'Иваныч', 1, '43');

-- --------------------------------------------------------

--
-- Структура таблицы `tours_and_tourists`
--

CREATE TABLE `tours_and_tourists` (
  `id` int(11) NOT NULL,
  `id_tour` int(11) DEFAULT NULL,
  `id_tourist` int(11) DEFAULT NULL,
  `id_hotel` int(11) DEFAULT NULL,
  `id_number` int(11) DEFAULT NULL,
  `arrival` date DEFAULT NULL,
  `departure` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `excursions`
--
ALTER TABLE `excursions`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `numbers`
--
ALTER TABLE `numbers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_hotel` (`id_hotel`);

--
-- Индексы таблицы `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `excursions` (`excursions`);

--
-- Индексы таблицы `tourist`
--
ALTER TABLE `tourist`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tours_and_tourists`
--
ALTER TABLE `tours_and_tourists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tour` (`id_tour`),
  ADD KEY `tours_and_tourists_ibfk_2` (`id_tourist`),
  ADD KEY `id_hotel` (`id_hotel`),
  ADD KEY `id_number` (`id_number`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `excursions`
--
ALTER TABLE `excursions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `hotels`
--
ALTER TABLE `hotels`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `numbers`
--
ALTER TABLE `numbers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `tour`
--
ALTER TABLE `tour`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `tourist`
--
ALTER TABLE `tourist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `tours_and_tourists`
--
ALTER TABLE `tours_and_tourists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `numbers`
--
ALTER TABLE `numbers`
  ADD CONSTRAINT `numbers_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `hotels` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tour`
--
ALTER TABLE `tour`
  ADD CONSTRAINT `tour_ibfk_1` FOREIGN KEY (`excursions`) REFERENCES `excursions` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tours_and_tourists`
--
ALTER TABLE `tours_and_tourists`
  ADD CONSTRAINT `tours_and_tourists_ibfk_1` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tours_and_tourists_ibfk_2` FOREIGN KEY (`id_tourist`) REFERENCES `tourist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tours_and_tourists_ibfk_3` FOREIGN KEY (`id_hotel`) REFERENCES `hotels` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tours_and_tourists_ibfk_4` FOREIGN KEY (`id_number`) REFERENCES `numbers` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
