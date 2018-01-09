-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: sql100.epizy.com
-- Generation Time: Jan 09, 2018 at 01:01 AM
-- Server version: 5.6.35-81.0
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `epiz_21223681_vc35photography`
--

-- --------------------------------------------------------

--
-- Table structure for table `learning_info`
--

CREATE TABLE IF NOT EXISTS `learning_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `description` longtext,
  `tags` longtext,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `category_id_2` (`category_id`),
  KEY `category_id_3` (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `learning_info`
--

INSERT INTO `learning_info` (`id`, `category_id`, `description`, `tags`) VALUES
(1, 1, '<ul><li>Turn off Image stablizer</li><li>ISO -> for day low</li><li>Evening : decrease exposure increase ISO</li><li>Use manual focus</li><li>Remote shutter control</li></ul>', 'time-lapse night'),
(3, 1, '<ul> <li>shutter-speed 1/100 secs</li> <li>aperture f/8</li> <li>ISO 100</li> </ul>\r\n', 'beach sun-up'),
(2, 1, '<ul> <li>shutter-speed 20 secs</li> <li>aperture f/18</li> <li>ISO 50/100</li> </ul>\r\n', 'beach sun-down'),
(4, 1, '<ul><li>if one of the three is changed, then atleast one more is required to be changed</li></ul>  ', 'exposure-triangle'),
(5, 1, '<ul><li> aperture effects depth of field DOF (amount of blur)</li><li>     for landscape : should be between f/10 and f/14 </li><li>     for portraits : f/1.8 between f/5</li></ul> ', 'exposure-triangle aperture landscape dof depth-of-field portrait'),
(6, 1, '<ul> <li>shutter speed affects motion blur</li> <li>for landscape : don''t care as we shoot on tripod</li> <li>sunrise/sunset : 10 - 30 sec exposure </li> <li>bird : 1/1000 sec</li> <li>humming bird freeze : 1/8000 sec</li> </ul>\r\n', 'exposure-triangle shutter-speed landscape sunrise sunset bird humming-bird'),
(7, 1, '<ul> <li>measure brightness of the subject</li> <li>Exposure bracketing three or more by one click of shutter (continious mode) , each in different exposure</li> <li>example : -2 -1 0 +1 +2</li> <li>hdr : blending multiple exposure to create one image</li> <li>EV values : exposure compensation , to alter exposure from the value selected</li> <li>For Landscape should be Ev -1, else sky is over exposed</li> <li>Mist and Fog always over exposed EV +1</li> </ul>\r\n <ul><li>Mist and Fog exposure from EV+1 upto EV+3 until you get it correct</li><li> Never Over expose an Image</li></ul>', 'metering hdr ev landscape exposure fog mist'),
(8, 1, '<ul><li>Iso manges sensitivity</li><li>\r\nThe digital gain that your camera applies to add more light</li><li>\r\nThe lower the ISO number the less sensitive camera is to light. The higher ISO number increases the sensitivity of your camera</li><li>\r\nTrade off with high sensitivity is the noise element the camera applies in creating the digital gain</li><li>    \r\nOn full frame camera : allows dynamic range : iso 100 and below  as low to iso 32 on full frame camera</li><li>\r\nFor landscape shoot at ISO 100 or below</li><li>\r\nHandheld on low light ISO 1000 or ISO 1600 will create grain but is fine</li><li>\r\nGalaxies : ISO 2000 or above (noise adds to the stars)</li></ul>', 'exposure-triangle iso milkyway stars galaxies landscape handheld'),
(9, 3, 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'aperture iso'),
(10, 2, '<ul><li>Examples</li></ul>', 'portraits examples'),
(11, 1, '<ul><li>dont change the EV value instead alter ISO shutter speed or aperture</li><li>\r\nfor Kingfisher bird change the EV value to get exposure on the bird correct</li><li> for eg: -3 -1 +1 +3\r\n</li></ul>', 'manual-mode kingfisher-bird'),
(12, 1, '<ul><li>Full control</li><li>\r\nFlexibility to set your shots</li><li>\r\nAllows creative freedom</li><li>\r\nStrong knowledge of exposure triangle</li><li>\r\nIdeal for all genres of photography</li></ul>', 'manual-mode '),
(13, 1, '<ul><li>Adjustable opening  that limits the amount of light passing through it to the sensor</li><li>  \r\nDiameter of such an opening is often expresses as f-number</li><li>  \r\nAperture controls DOF depth of field.</li><li>  \r\nchange EV value and take a shot and then change ev value to -1 -2 or as required</li><li>   \r\nSemi manual mode  you choose aperture. ISO can be set or camera can choose ISO</li><li>   \r\nNot ideal for complex lighting conditions</li></ul>', 'aperture-mode av aperture'),
(14, 1, '<ul><li>Ideal for wedding  wildlife and portraits</li></ul>', 'portraits aperture-mode av  wedding wildlife'),
(15, 1, '<ul><li>camera choose shutter speed and aperture\r\n</li></ul>', 'program-mode'),
(16, 1, '<ul><li>Semi manual mode  you choose shutter speed</li><li>\r\nEnsure you have well balanced exposure and correct metering</li><li>\r\nNot ideal for complex lighting conditions</li></ul>', 'shutter-priority tv'),
(17, 1, '<ul><li>Ideal for Street Wildlife and Sports</li></ul>', 'wildlife shutter-priority tv  sports street'),
(18, 1, '<ul><li>long extended exposure  30 sec +</li><li>\r\nShutter will remain open until you press the shutter down again</li><li>\r\nIdeal for long exposures\r\n</li></ul>', 'bulb-mode'),
(19, 1, '<ul><li>Shooting handled :</li><li>\r\nTravel light</li><li>\r\nGet better angles</li><li>\r\nEasy to shoot</li><li>\r\nLess setup time</li><li>\r\ncan do semi long exposure 1/15  1/8. Require steady hand or some kind of support</li><li>\r\nIdeal for shooting fast changing moment</li><li>\r\nIdeal for good lighting conditions\r\n</li></ul>', 'handheld fast-changing-moments'),
(20, 1, '<ul><li>Shooting in Tripod:</li><li>\r\nMax stability</li><li>\r\nshooting in low light</li><li>\r\ncan use filters</li><li>\r\ncan do long exposures</li><li>\r\nsetting up takes times</li><li>\r\ngive sense of motion</li></ul>', 'tripod'),
(21, 1, '<ul><li>Tripod and Mono-pod:</li><li>\r\nLow light photography</li><li>\r\nLight trails Astronomical Time lapse Panorama Long Exposure</li><li>\r\nAbility to shoot of very low angles\r\n\r\nMonopod is great to shoot on move and is more portable\r\ncan be used to capture higher angles</li></ul>', 'time-lapse tripod  monopod long-exposure panorama light-trails astronomical'),
(22, 1, '<ul><li>Shutter release:</li><li>\r\navoid camera shake</li><li>\r\nshooting in bracketing mode</li><li>\r\nshooting in low light with tripod</li><li>\r\nkeep shutter locked as long as you want</li><li>\r\nIf shutter speed is above 30 sec then use shutter release cable  else set shutter timer and set exposure length</li></ul>', 'tripod  shutter-release bracketing-mode'),
(23, 1, '<ul><li>Hyper focal distance</li><li> \r\nright focusing distance that gives your photos the greatest depth of field</li><li> \r\nFocus at a particular point between foreground and background  which makes both foreground and background elements of the scene appear reasonably sharp</li><li> \r\nUsually 1/3rd into the frame</li><li> \r\nalways shoot in hyper focal distance if you are traveller and landscape photographer</li></ul> ', 'landscape  hyper-focal-distance traveller'),
(24, 1, '<ul><li>Narrow DOF : Larger Aperture f/1.8 f/2.8 narrowed zone of sharpness</li><li>  \r\nWide DOF : Small aperture f/8 f/11 and above f/14 and so</li></ul>', 'dof depth-of-field'),
(25, 1, '<ul><li>Camera mode dial in M mode or B bulb mode</li><li> Iso 100 ensure auto Iso is off</li><li> shutter speed in bulb</li><li> aperture f/11 or within f/8 and f/16</li><li> white balance in sunlight</li><li> focus in manual turn lens stabilizer  off</li></ul>', 'fireworks'),
(26, 1, '<ul><li>Build a strong foundation</li><li> \r\nYou can''t remember everything during your photo shoot</li><li> \r\nFocus on getting sharp image and right exposure</li><li> \r\nAvoid falling for the trap of changing lens for every shot ( Try to carry one body and one lens for e.g.: 24-70mm or 28-300mm) </li><li> \r\nTry all modes to know what works best in what condition</li><li> \r\nUnderstand the limitation of kit lens</li><li> \r\nControl the noise</li><li> \r\nWhen to use tripod and when to go hand held</li><li> \r\nUse depth of field to your advantage</li><li> \r\nHyper focal distance - key to creating sharpness across the frame. (1/3rd into frame)\r\n</li><li> </li></ul>', 'Fundamentals Photography'),
(27, 1, '', 'aperture-mode av aperture wildlife  BOKEH Havelock-Island Andaman starbust'),
(28, 1, '<ul><li>Shutter Speed causes motion blur</li><li>\r\nWildlife : If tiger is attacking then shutter speed should be 1/800 or 1/1000 to freeze the moment</li><li>\r\nTo Capture the stillness of the sea 15 sec or waterfall which is milky 2 sec or 5 sec</li><li>\r\nGalaxies : should be around 2 sec or nearby value. 60 sec or more will cause stars to move and will cause blur\r\n\r\n</li></ul>', 'exposure-triangle shutter-speed galaxies wildlife  motion-blur tiger sea waterfall'),
(29, 1, '', 'iso galaxies examples  smoke'),
(30, 1, '<ul><li>You have to optimize the value by adjusting ISO</li><li> shutter speed and aperture</li></ul> <ul><li>Different types of metering:</li><li>\r\nMatrix Metering in Nikon and Evaluative metering in Canon</li><li>\r\nCenter wighted metering : light in center</li><li>\r\nSpot Metering : right where camera is focused\r\n</li></ul> ', 'metering'),
(31, 1, '<ul><li>Doubling or halving the amount of light entering the camera when taking the photo</li><li>\r\n1stop : double the light entering the camera\r\n</li></ul> ', 'stops'),
(32, 3, '<ul><li>Landscape is shot in Evalutive or Center weighted metering</li></ul>', 'landscape metering '),
(33, 2, '<ul><li>Shots exampled at location Pushkar and Varanasi are shot in Spot or partial metering</li></ul>', 'metering portraits '),
(34, 1, '', 'metering examples  spot-metering'),
(35, 1, '', 'metering examples  evaluative-metering'),
(36, 1, '', 'metering examples  partial-metering'),
(37, 1, '', 'metering examples ');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
