-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 16, 2014 at 09:55 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbemployee1030`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delemp`(IN `eno` INT)
    NO SQL
begin
delete from tbemp where empno=eno;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `disemp`()
    NO SQL
begin
select * from tbemp;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findemp`(IN `eno` INT)
    NO SQL
begin
select * from tbemp where empno=eno;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insemp`(IN `eno` INT, IN `en` VARCHAR(50), IN `ed` VARCHAR(50), IN `es` INT)
    NO SQL
begin
insert tbemp values(eno,en,ed,es);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `logincheck`(IN `u` VARCHAR(50), IN `p` VARCHAR(50), OUT `ret` INT)
    NO SQL
begin
declare ap varchar(50);
select upass from tbuser where uname=u into @ap;
if @ap is null then
set ret=-1;
else
if @ap=p then
set ret=1;
else
set ret=-2;
end if;
end if;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updemp`(IN `eno` INT, IN `en` VARCHAR(50), IN `ed` VARCHAR(50), IN `es` INT)
    NO SQL
begin
update tbemp set ename=en,eadd=ed,esal=es where empno=eno;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbbook`
--

CREATE TABLE IF NOT EXISTS `tbbook` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `pub` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `img` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbbook`
--

INSERT INTO `tbbook` (`id`, `title`, `author`, `pub`, `price`, `img`) VALUES
(101, 'vb.net', 'aaa', 'vvbb', 123, 'a1.jpg'),
(102, 'php', 'fbd', 'gfd', 345, 'a2.jpg'),
(103, 'java', 'dfgh', 'dsha', 764, 'a3.jpg'),
(104, 'oracle', 'jhg', 'bvnc', 876, 'a4.jpg'),
(105, 'maths', 'ahgs', 'tret', 198, 'a5.jpg'),
(106, 'english', 'cuty', 'oiuy', 654, 'a6.jpg'),
(107, 'scis', 'vtre', 'kgad', 435, 'a7.jpg'),
(108, 'evs', 'jhyg', 'vghv', 435, 'a8.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbdep`
--

CREATE TABLE IF NOT EXISTS `tbdep` (
  `dno` int(11) NOT NULL,
  `dname` varchar(50) NOT NULL,
  PRIMARY KEY (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbdep`
--

INSERT INTO `tbdep` (`dno`, `dname`) VALUES
(10, 'accts'),
(20, 'sales'),
(30, 'mkt');

-- --------------------------------------------------------

--
-- Table structure for table `tbdsg`
--

CREATE TABLE IF NOT EXISTS `tbdsg` (
  `dsgcod` int(11) NOT NULL,
  `dsgname` varchar(50) NOT NULL,
  PRIMARY KEY (`dsgcod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbdsg`
--

INSERT INTO `tbdsg` (`dsgcod`, `dsgname`) VALUES
(101, 'PM'),
(102, 'TL'),
(103, 'prog');

-- --------------------------------------------------------

--
-- Table structure for table `tbemp`
--

CREATE TABLE IF NOT EXISTS `tbemp` (
  `empno` int(11) NOT NULL,
  `ename` varchar(50) NOT NULL,
  `eadd` varchar(100) NOT NULL,
  `esal` int(11) NOT NULL,
  PRIMARY KEY (`empno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbemp`
--

INSERT INTO `tbemp` (`empno`, `ename`, `eadd`, `esal`) VALUES
(101, 'shabnam sharma', 'kangra', 15000),
(103, 'anny', 'dddd', 1000),
(104, 'rohan sharma', 'shahpur', 16000),
(145, 'amit', 'jhg', 12),
(324, 'mandeep', 'hfgd', 1987);

-- --------------------------------------------------------

--
-- Table structure for table `tbemp1`
--

CREATE TABLE IF NOT EXISTS `tbemp1` (
  `empno` int(11) NOT NULL,
  `ename` varchar(50) NOT NULL,
  `eadd` varchar(100) NOT NULL,
  `esal` int(11) NOT NULL,
  PRIMARY KEY (`empno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbemp1`
--

INSERT INTO `tbemp1` (`empno`, `ename`, `eadd`, `esal`) VALUES
(1, 'anit', '#fdfd', 120000),
(2, 'vikas', '#hgds', 20000),
(3, 'daman', '#kjhg', 10000),
(4, 'raman', '#xcvb', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `tbemployee`
--

CREATE TABLE IF NOT EXISTS `tbemployee` (
  `empno` int(11) NOT NULL,
  `ename` varchar(50) NOT NULL,
  `eadd` varchar(50) NOT NULL,
  `esal` int(11) NOT NULL,
  `edno` int(11) NOT NULL,
  `edsgcod` int(11) NOT NULL,
  PRIMARY KEY (`empno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbemployee`
--

INSERT INTO `tbemployee` (`empno`, `ename`, `eadd`, `esal`, `edno`, `edsgcod`) VALUES
(1, 'shabnam', 'kangra', 120000, 10, 101),
(2, 'vikas kumar', '#gfgf', 20000, 10, 101),
(3, 'daman', '#rgh', 30000, 30, 103),
(4, 'raman', '#fdsgh', 50000, 10, 101);

-- --------------------------------------------------------

--
-- Table structure for table `tbord`
--

CREATE TABLE IF NOT EXISTS `tbord` (
  `ordcod` int(11) NOT NULL AUTO_INCREMENT,
  `orddat` date NOT NULL,
  PRIMARY KEY (`ordcod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tborddet`
--

CREATE TABLE IF NOT EXISTS `tborddet` (
  `orddetordcod` int(11) NOT NULL,
  `orddetbookid` int(11) NOT NULL,
  `orddetqty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbuser`
--

CREATE TABLE IF NOT EXISTS `tbuser` (
  `uname` varchar(50) NOT NULL,
  `upass` varchar(50) NOT NULL,
  PRIMARY KEY (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbuser`
--

INSERT INTO `tbuser` (`uname`, `upass`) VALUES
('123', 'vipan'),
('234', 'varun'),
('654', 'amol'),
('admin', 'ad'),
('admin1', 'ad1'),
('admin2', 'ad2'),
('admin3', 'ad3');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
