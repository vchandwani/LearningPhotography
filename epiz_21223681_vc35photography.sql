-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: sql100.epizy.com
-- Generation Time: Jan 11, 2018 at 07:34 PM
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
-- Table structure for table `learning`
--

CREATE TABLE IF NOT EXISTS `learning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category` (`category`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `learning`
--

INSERT INTO `learning` (`id`, `category`) VALUES
(1, 'Home'),
(2, 'Portraits'),
(3, 'Landscape'),
(4, 'Tools');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

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
(37, 1, '', 'metering examples '),
(38, 1, '<ul><li>Law of Reciprocity</li><li>  \r\nVariables : Relationship between (ISO  Shutter Speed and Aperture) and Stops of light</li></ul>', 'law-of-reciprocity'),
(39, 1, '<ul><li>White balance : The color of an object is affected by the lighting conditions under which it is viewed.</li><li>\r\nOur eyes and our brain compensate for different types of light but digital cameras need help to emulate this process. To compensate for different types of lighting and render a white object white</li><li>\r\nThe white balance setting helps to do just that.\r\n</li></ul>', 'white-balance'),
(40, 1, '<ul><li>UV filter : helps cut uv rays</li></ul>', 'filters uv-filter'),
(41, 1, '<ul><li>Polarizing : helps to cut haze</li><li> reflection. Water reflection</li></ul>', 'filters  polarizing-filter reflection'),
(42, 1, '<ul><li>Infrared : To Shoot infrared</li></ul>', 'filters  infrared-filter'),
(43, 1, '<ul><li>Black and White : native mono chrome</li></ul>', 'filters  black-white-filter'),
(44, 1, '<ul><li>Warming : very widely used for landscape</li></ul>', 'landscape filters  warming-filters'),
(45, 1, '<ul><li> ND Filter</li><li>\r\n  Soft Grad : horizon is not very clear</li><li>\r\n  Hard Grad : Definitive line between. Horizon is clear and definitive line can be found</li><li> sunset at beach</li><li>\r\n  Neutral Grad : entire filter cuts specific stop of light. Used for slower shutter  waterfall  sun beach  river</li></ul>', 'beach sun-up filters  nd-filter river waterfall'),
(46, 1, '<ul><li>Types of Filters </li><li> \r\nCircular : For a specific lens size. Easy to use. Use step up ring to fit higher sized circular filter</li><li> \r\nSquared : 100mm and higher size. Filter holder and adaptive ring   Step up and step down ring</li><li> \r\nOne fits all lenses and easier to stack</li></ul>', 'filters '),
(47, 4, '<ul><li>Depth of Field (DOF) and Hyper Focal Distance (HFD)\r\n<div id="ppdof"></div><script src="//photopills.com/widgets/ppdof.min.js" async></script></li></ul>', 'depth-of-field dof hyper-focal-distance');

-- --------------------------------------------------------

--
-- Table structure for table `learning_info_examples`
--

CREATE TABLE IF NOT EXISTS `learning_info_examples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `learning_info_id` int(11) NOT NULL,
  `image` longtext,
  `sub_image` longtext,
  `image_header` longtext,
  `image_description` longtext,
  PRIMARY KEY (`id`),
  KEY `learning_info_id` (`learning_info_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `learning_info_examples`
--

INSERT INTO `learning_info_examples` (`id`, `learning_info_id`, `image`, `sub_image`, `image_header`, `image_description`) VALUES
(1, 10, 'https://i1.wp.com/digital-photography-school.com/wp-content/uploads/2012/05/split-lighting-pattern1.jpg?resize=600%2C900&ssl=1', 'https://i2.wp.com/digital-photography-school.com/wp-content/uploads/2012/05/split-lighting-by-Darlene-Hildebrandt.png?resize=381%2C284&ssl=1', 'Split Lighting', 'Split lighting is exactly as the name implies – it splits the face exactly into equal halves with one side being in the light, and the other in shadow. It is often used to create dramatic images for things such as a portrait of a musician or an artist. Split lighting tends to be a more masculine pattern and as such is usually more appropriate or applicable on men than it is for women.\r\nTo achieve split lighting simply put the light source 90 degrees to the left or right of the subject, and possibly even slightly behind their head.'),
(2, 10, 'https://i2.wp.com/digital-photography-school.com/wp-content/uploads/2012/05/Catch-lights-example.jpg?resize=600%2C400&ssl=1', '', 'Catchlight', 'See how the bright spot is actually hexagon with a dark centre? That’s the light I used which was a small hexagon shaped soft box on my Canon speedlight.\r\n                                                            This is what is known as the “catchlight”. Without the eye of the subject catching this light, the eyes will appear dark, dead and lifeless. You need to ensure that at least one eye has a catchlight to give the subject life. Notice it also lightens the iris and brightens the eye overall. This also adds to the feeling of life and gives them a sparkle.'),
(3, 10, 'https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2012/05/Loop-lighting-pattern.jpg?resize=600%2C900&ssl=1', 'https://i2.wp.com/digital-photography-school.com/wp-content/uploads/2012/05/loop-lighting-by-Darlene-Hildebrandt.png?resize=399%2C527&ssl=1', 'Loop Lighting', 'Loop lighting is made by creating a small shadow of the subjects noses on their cheeks. To create loop lighting, the light source must be slightly higher than eye level and about 30-45 degrees from the camera (depends on the person, you have to learn how to read peopleï¿½s faces).'),
(4, 10, 'https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2012/05/Loop-lighting-pattern-example.jpg?resize=600%2C400&ssl=1', NULL, 'Loop Lighting', 'Look at this image to see where the shadows fall, and on their left sides you can see a small shadow of their noses. In loop lighting the shadow of the nose and that of the cheek do NOT touch. Keep the shadow small and slightly downward pointing, but be aware of having your light source too high which will create odd shadows and cause loss of the catchlights. Loop light is probably the most common or popular lighting pattern as it is easy to create and flatters most people.'),
(5, 10, 'https://i2.wp.com/digital-photography-school.com/wp-content/uploads/2012/05/Rembrandt-lighting-pattern.jpg?resize=600%2C900&ssl=1', 'https://i1.wp.com/digital-photography-school.com/wp-content/uploads/2012/05/Rembrandt-lighting-by-Darlene-Hildebrandt.png?resize=489%2C507&ssl=1', 'Rembrandt Lighting', 'Rembrandt lighting is so named because the Rembrandt the painter often used this pattern of light in his paintings, as you can see in his self portrait here. Rembrandt lighting is identified by the triangle of light on the cheek. Unlike loop lighting where the shadow of the nose and cheek do not touch, in Rembrandt lighting they do meet which, creates that trapped little triangle of light in the middle. To create proper Rembrandt lighting make sure the eye on the shadow side of the face has light in it and has a catch light, otherwise the eye will be “dead” and not have a nice sparkle. Rembrandt lighting is more dramatic, so like split lighting it creates more mood and a darker feel to your image. Use it appropriately.'),
(6, 10, 'https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2012/05/Butterfly-lighting-pattern.jpg?resize=600%2C900&ssl=1', 'https://i2.wp.com/digital-photography-school.com/wp-content/uploads/2012/05/butterfly-lighting-by-Darlene-Hildebrandt-1.png?resize=202%2C459&ssl=1', 'Butterfly Lighting', 'Broad lighting is when the subject’s face is slightly turned away from centre, and the side of the face which is toward the camera (is broader) is in the light. This produces a larger area of light on the face, and a shadow side which appears smaller. Broad lighting is sometimes used for “high key” portraits. This type of lighting makes a person’s face look broader or wider (hence the name) and can be used on someone with a very slim face to widen it. Most people however want to look slimmer, not wider so this type of lighting would not be appropriate for someone who is heavier or round faced.\r\n                                                            To create broad lighting the face is turned away from the light source. Notice how the side of the face that is towards the camera has the most light on it and the shadows are falling on the far side of the face, furthest from the camera. Simply put broad lighting illuminates the largest part of the face showing.'),
(7, 10, 'https://i1.wp.com/digital-photography-school.com/wp-content/uploads/2012/05/Broad-lighting.jpg?resize=600%2C900&ssl=1', 'https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2012/05/broad-lighting-by-Darlene-Hildebrandt.png?resize=355%2C418&ssl=1', 'Broad Lighting', 'Broad lighting is when the subject’s face is slightly turned away from centre, and the side of the face which is toward the camera (is broader) is in the light. This produces a larger area of light on the face, and a shadow side which appears smaller. Broad lighting is sometimes used for “high key” portraits. This type of lighting makes a person’s face look broader or wider (hence the name) and can be used on someone with a very slim face to widen it. Most people however want to look slimmer, not wider so this type of lighting would not be appropriate for someone who is heavier or round faced.\r\nTo create broad lighting the face is turned away from the light source. Notice how the side of the face that is towards the camera has the most light on it and the shadows are falling on the far side of the face, furthest from the camera. Simply put broad lighting illuminates the largest part of the face showing.'),
(8, 10, 'https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2012/05/Short-lighting.jpg?resize=600%2C900&ssl=1', 'https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2012/05/short-lighting-by-Darlene-Hildebrandt.png?resize=300%2C351&ssl=1', 'Short Lighting', 'Short lighting is the opposite of broad lighting. As you can see by the example here, short lighting puts the side turned towards the camera (that which appears larger) in more shadow. It is often used for low key, or darker portraits. It puts more of the face in shadow, is more sculpting, add 3D qualities, and is slimming and flattering for most people.\r\n                                                            In short lighting, the face is turned towards the light source this time. Notice how the part of the face that is turned away from the camera has the most light on it and the shadows are falling on the near side of the face, closet to the camera. Simply put short lighting has shadows on the largest part of the face showing.'),
(9, 4, 'http://vc35photography.epizy.com/resources/Exposure Triangle.jpg', '', '', ''),
(10, 5, 'http://vc35photography.epizy.com/resources/DOF1.jpg', '', '', ''),
(11, 5, 'http://vc35photography.epizy.com/resources/DOF2.jpg', '', '', ''),
(12, 27, 'http://vc35photography.epizy.com/resources/Aperture1.jpg', '', 'BOKEH', 'Lower f value, better BOKEH'),
(13, 27, 'http://vc35photography.epizy.com/resources/Aperture2.jpg', '', 'Havelock Island,Andaman', ''),
(14, 27, 'http://vc35photography.epizy.com/resources/Aperture3.jpg', '', '', ''),
(15, 27, 'http://vc35photography.epizy.com/resources/Aperture4.jpg', '', 'starbust', 'f/22 allows starbust'),
(16, 27, 'http://vc35photography.epizy.com/resources/Aperture5.jpg', '', '', ''),
(17, 27, 'http://vc35photography.epizy.com/resources/Aperture6.jpg', '', 'Wildlife', ''),
(18, 27, 'http://vc35photography.epizy.com/resources/Aperture7.jpg', '', '', ''),
(19, 23, 'http://vc35photography.epizy.com/resources/HyperFocalDistance.jpg', '', '', ''),
(20, 23, 'http://vc35photography.epizy.com/resources/HyperFocalDistance2.jpg', '', '', ''),
(21, 23, 'http://vc35photography.epizy.com/resources/HyperFocalDistance3.jpg', '', '', ''),
(22, 23, 'http://vc35photography.epizy.com/resources/HyperFocalDistance4.jpg', '', '', ''),
(23, 23, 'http://vc35photography.epizy.com/resources/HyperFocalDistance5.jpg', '', '', ''),
(24, 23, 'http://vc35photography.epizy.com/resources/HyperFocalDistance6.jpg', '', '', ''),
(25, 23, 'http://vc35photography.epizy.com/resources/HyperFocalDistance7.jpg', '', '', ''),
(26, 28, 'http://vc35photography.epizy.com/resources/MotionBlur.JPG', '', '', ''),
(27, 28, 'http://vc35photography.epizy.com/resources/ShutterSpeed1.JPG', '', '', ''),
(28, 28, 'http://vc35photography.epizy.com/resources/ShutterSpeed2.JPG', '', '', 'Exposure for long time shows only static objects'),
(29, 28, 'http://vc35photography.epizy.com/resources/ShutterSpeed3.JPG', '', '', ''),
(30, 28, 'http://vc35photography.epizy.com/resources/ShutterSpeed4.JPG', '', '', ''),
(31, 28, 'http://vc35photography.epizy.com/resources/ShutterSpeed5.JPG', '', '', ''),
(32, 28, 'http://vc35photography.epizy.com/resources/ShutterSpeed6.JPG', '', '', 'Waves are removes by large exposure time'),
(33, 28, 'http://vc35photography.epizy.com/resources/ShutterSpeed7.JPG', '', '', 'To capture this kind of shot, you need to move your camera along with the movement of the object and keep it in focus. It causes blur effect on background'),
(34, 4, 'http://vc35photography.epizy.com/resources/Exposure Triangle Conc.jpg', '', '', ''),
(35, 29, 'http://vc35photography.epizy.com/resources/ISO1.JPG', '', '', 'ISO 200 onwards noise is visible and images are not usable'),
(36, 29, 'http://vc35photography.epizy.com/resources/ISO2.JPG', '', '', 'It creates the noise, but you tend to focus on boy. SMoke texture comes out on higher ISO '),
(37, 29, 'http://vc35photography.epizy.com/resources/ISO3.JPG', '', '', 'Galaxy shot are always above ISO 2000'),
(38, 29, 'http://vc35photography.epizy.com/resources/ISO4.JPG', '', '', 'Higher ISO helps smoke to be visible'),
(39, 29, 'http://vc35photography.epizy.com/resources/ISO5.JPG', '', '', 'High ISO helps in adding roughness to the shot'),
(40, 29, 'http://vc35photography.epizy.com/resources/ISO6.JPG', '', '', 'High ISO helps for smoke to be visible'),
(41, 29, 'http://vc35photography.epizy.com/resources/ISO7.JPG', '', '', 'High ISO helps for smoke to be visible'),
(42, 29, 'http://vc35photography.epizy.com/resources/ISO8.JPG', '', '', ''),
(43, 29, 'http://vc35photography.epizy.com/resources/ISO9.JPG', '', '', 'High ISO helps for smoke to be visible'),
(44, 31, 'http://vc35photography.epizy.com/resources/Stop.JPG', '', '', ''),
(45, 31, 'http://vc35photography.epizy.com/resources/Stop1.JPG', '', '', ''),
(46, 30, 'http://vc35photography.epizy.com/resources/Metering1.JPG', '', '', ''),
(47, 30, 'http://vc35photography.epizy.com/resources/Metering2.JPG', '', '', ''),
(48, 34, 'http://vc35photography.epizy.com/resources/Metering3.JPG', '', '', 'helps in exposing Pelican and under exposing background'),
(49, 34, 'http://vc35photography.epizy.com/resources/Metering7.JPG', '', '', 'show expression and focus on man'),
(50, 35, 'http://vc35photography.epizy.com/resources/Metering5.JPG', '', '', 'illuminate entire frame, camera decides'),
(51, 35, 'http://vc35photography.epizy.com/resources/Metering11.JPG', '', '', 'illuminate entire frame, camera decides'),
(52, 35, 'http://vc35photography.epizy.com/resources/Metering12.JPG', '', '', 'illuminate entire frame, camera decides'),
(53, 36, 'http://vc35photography.epizy.com/resources/Metering4.JPG', '', '', 'Group of Pelicans to be exposed'),
(54, 37, 'http://vc35photography.epizy.com/resources/Metering6.JPG', '', '', 'entire center of image is illuminated'),
(55, 37, 'http://vc35photography.epizy.com/resources/Metering8.JPG', '', '', 'entire center of image is illuminated'),
(56, 37, 'http://vc35photography.epizy.com/resources/Metering10.JPG', '', '', ''),
(57, 37, 'http://vc35photography.epizy.com/resources/Metering9.JPG', '', '', ''),
(58, 39, 'http://vc35photography.epizy.com/resources/WB1.JPG', '', '', ''),
(59, 39, 'http://vc35photography.epizy.com/resources/WB2.JPG', '', '', ''),
(60, 39, 'http://vc35photography.epizy.com/resources/WB3.JPG', '', '', 'was hot day, feels like that'),
(61, 39, 'http://vc35photography.epizy.com/resources/WB4.JPG', '', '', 'deliberately made the image cool, on boat white looks white not any other color'),
(62, 39, 'http://vc35photography.epizy.com/resources/WB5.JPG', '', '', 'Misty morning'),
(63, 39, 'http://vc35photography.epizy.com/resources/WB6.JPG', '', '', 'whole chair is not blue'),
(64, 39, 'http://vc35photography.epizy.com/resources/WB7.JPG', '', '', 'Hills no sunrise and sunset, unless sunrise and sunset point. Tweaks WB to greener to reflect the mood'),
(65, 39, 'http://vc35photography.epizy.com/resources/WB8.JPG', '', '', 'Very early in the morning, almost darkness, 6-7 sec exposure. Very cold and Dark place. ');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `username`, `password`, `salt`) VALUES
(1, 'admin', '28997f95faab2c2376e1b1bd9808dd6ddedfa7d4', '$%^7**');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
