-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: sql100.epizy.com
-- Generation Time: Feb 06, 2018 at 12:54 AM
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `learning`
--

INSERT INTO `learning` (`id`, `category`) VALUES
(1, 'Home'),
(2, 'Portraits'),
(3, 'Landscape'),
(4, 'Tools'),
(5, 'Wildlife'),
(6, 'Macro'),
(7, 'Street'),
(8, 'BlackAndWhite'),
(9, 'PostProcessing'),
(10, 'UploadStock');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=82 ;

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
(9, 3, '<ul><li>Retain details of highlight, for example when clicking Sun covered with clouds, retain details of cloud covering Sun</li></ul>', 'landscape'),
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
(26, 1, '<ul><li>Build a strong foundation</li></ul><ul><li> \r\nYou can''t remember everything during your photo shoot</li></ul><ul><li> \r\nFocus on getting sharp image and right exposure</li></ul><ul><li> \r\nAvoid falling for the trap of changing lens for every shot ( Try to carry one body and one lens for e.g.: 24-70mm or 28-300mm) </li></ul><ul><li> \r\nTry all modes to know what works best in what condition</li></ul><ul><li> \r\nUnderstand the limitation of kit lens</li></ul><ul><li> \r\nControl the noise</li></ul><ul><li> \r\nWhen to use tripod and when to go hand held</li></ul><ul><li> \r\nUse depth of field to your advantage</li></ul><ul><li> \r\nHyper focal distance - key to creating sharpness across the frame. (1/3rd into frame)</li></ul>', 'Fundamentals Photography'),
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
(47, 4, '<ul><li>Depth of Field (DOF) and Hyper Focal Distance (HFD)\r\n<div id="ppdof"></div><script src="//photopills.com/widgets/ppdof.min.js" async></script></li></ul>', 'depth-of-field dof hyper-focal-distance'),
(48, 1, '<ul><li>1. Focal length defines how big the moon will appear in the photo\r\n</li></ul>', 'super-moon moon'),
(49, 1, '<ul><li>2. Go to a location with an interesting subject  a beautiful landscape and space to move</li></ul>', 'landscape super-moon moon '),
(50, 1, '<ul><li>3. The shooting spot determines the size of the moon relative to your subject</li><li> \r\nfocal length determines how big the moon will appear in the photo compared to the frame (field of view). But it is the distance between the shooting spot and your subject that determines how big the moon will appear to be in relation with the subject. This is due to the angular diameter of the moon.</li></ul>', 'super-moon moon size'),
(51, 1, '<ul><li>1. Choose a location with room to maneuver and reduce trial and error</li><li> \r\nBe clever and start your planning in a location with a wide range of possible spots from where to shoot.\r\n2. Look for the best light</li><li> \r\n3. Assess the elevation of the moon</li><li> \r\nNow you know that to capture a nice full moon  you need the sun to be at an elevation between 0.5â° and -6â°. Next step is to find the elevation of the moon for these two moments</li><li> \r\nDrag the top panel to the right to go to the sun/moon azimuth/elevation information panel and use the time bar to move time until the elevation of the sun you read on the top panel is 0.5â°. This happens at 8:43pm. Now  jot down the elevation of the moon: 2.9â°.</li><li> \r\nKeep moving time until the elevation of the sun is -6â°  which happens at 9:17pm. Now  the elevation of the moon is 8.8â°.</li><li> \r\nIn conclusion  the best light moments to shoot the moon happen between 8:43 pm and 9:17pm. The moon will be at an elevation between 2.9â° and 8.8â° and the sun between 0.5â° and -6â°.</li><li> \r\n4. Find the shooting spot</li><li> \r\nThe time of the shoot is 8:43pm when the center of the moon is at azimuth 107.7â° and elevation 2.9â°</li><li> \r\nIf we assume that the moon has an angular diameter of 0.5â° then the lower border of the moon disk will be at an elevation of 2.65â° (2.9â°-0.25â°) and the top border at 3.15â° (2.9â°+0.25â°).</li><li> \r\n\r\nYouâ€™ll choose the shooting spot based on these three principles:\r\n\r\nIt has to be the furthest possible from the construction in order to capture a big full moon  at least 1km. The distance  of course  will always depend on the largest telephoto lens you''ll have available. In our case a 500mm prime lens. This way will manage to capture a moon bigger than the construction.</li><li> \r\nThe moon must be aligned with the construction  thus the azimuth line of the moon has to go over the construction.</li><li> \r\nThe relative elevation between the shooting spot (Observerâ€™s Pin) and the ground level of the old construction (Obstacleâ€™s pin) needs to be at last 2.65â°.</li><li> \r\n\r\nHave a look at the second screenshot. Notice that the top panel is telling you that the current Pin to Pin distance is 69.8m and the relative elevation 4.9â° (altitude difference). We need this elevation to be approximately 2.65â°.</li><li> \r\nKeep moving the Observerâ€™s pin closer until the relative elevation between pins is approximately 2.65â°.</li><li> \r\n\r\n5. Check whether the moon is large enough</li></ul> ', 'super-moon moon  plan'),
(52, 1, '<ul><li>Focus : the position of lens at which an image is clear and sharp</li><li>\r\nSingle Area Focus Mode : One Shot AF in Canon</li><li>\r\nContinuous / AI Servo Focus Mode : AI Servo in Canon In this mode Camera tracks the subject as it moves. Used extensively for Sports and Wildlife mode.</li><li>\r\nGroup area AF Mode : Group area AF in Canon. This takes into consideration a small cluster of space within which it tracks average contrast and then focuses</li><li>\r\nFull Auto Focus  :  this is when camera uses multiple focus points 9/11/256 or so on\r\n</li></ul>', 'wildlife sports  focus ai-servo single-focus af-mode auto-focus'),
(53, 1, '<ul><li>Graphical representation of tonal value of your image</li><li>\r\nBlack and whites are at corner  rest in middle.</li><li>\r\nMost of the data should be between shadows mid-tones and highlights.</li><li>\r\nAvoid data clipped towards black and white side</li><li>\r\nOn exposure 0 most of the data is at centre it is L curved</li></ul>', 'histogram'),
(54, 4, '<ul><li>TimeLapse</li><li>\r\n<div id="pptimelapse"></div>\r\n<script src="//photopills.com/widgets/pptimelapse.min.js" async></script></li></ul>', 'timelapse'),
(55, 4, '<ul><li>SPOT STARS CALCULATOR</li><li>\r\n<div id="ppspotstars"></div>\r\n<script src="//photopills.com/widgets/ppspotstars.min.js" async></script></li></ul>', 'spot-stars'),
(56, 4, '<ul><li>Macro DOF</li><li>\r\n<div id="ppdofmacro"></div>\r\n<script src="//photopills.com/widgets/ppdofmacro.min.js" async></script></li></ul>', 'macro-dof'),
(57, 4, '<ul><li>DOF Table</li><li>\r\n<div id="ppdoftable"></div>\r\n<script src="//photopills.com/widgets/ppdoftable.min.js" async></script></li></ul>', 'dof-table'),
(58, 4, '<ul><li>Hyper Focal Distance Table</li><li>\r\n<div id="pphyperfocal"></div>\r\n<script src="//photopills.com/widgets/pphyperfocal.min.js" async></script></li></ul>', 'hyper-focal-distance  hyper-focal-distance-table'),
(59, 1, '<ul><li>Guide to <a target="blank" href="https://www.photopills.com/articles/definitive-guide-star-trails">Star Trails</a></li></ul>', 'stars  star-trails'),
(60, 1, '<ul><li>Guide to <a target="blank" href="https://www.photopills.com/articles/how-shoot-truly-contagious-milky-way-pictures">Milky Way Shoot</a></li></ul>', 'milkyway '),
(61, 1, '<ul><li>Shoot with left rule (underexpose the image)</li><li>\r\nGives darker mood to image</li><li>\r\nmaintains histogram</li><li>\r\nachieve Natural Dynamic range</li><li>\r\nto retains details (landscape pics)</li><li>\r\nShoot semi silhouette image</li><li>\r\nBest for low-key photography</li></ul>', 'landscape  light silhouette low-key'),
(62, 1, '<ul><li>Shoot to right (deliberate over exposed)</li><li>\r\nTo get desirable exposure for your image</li><li>\r\nShooting in fog</li><li> snow and mist</li><li>\r\nShooting against white or grey background</li><li>\r\nShooting High-key photographs (fashion</li><li> models)</li></ul>', 'fog mist light  fashion models high-key snow'),
(63, 1, '<ul><li>Shoot in manual mode</li><li>\r\nto take creative control of light</li><li>\r\nshooting silhouette</li><li>\r\ncreating high key and low-key images</li><li>\r\nshooting in difficult lighting conditions (astro</li><li> light trails</li><li> light painting)</li><li>\r\nto get consistent exposure (light changes quickly) keep an eye on exposure triangle</li></ul>', 'manual-mode light-trails astronomical light silhouette '),
(64, 1, '<ul><li>Use filters to control light</li><li>\r\nEvens out the exposure of the image</li><li>\r\nND filters give you longer exposure to bring in sense of motion in your image</li><li>\r\nCPL / polarizing filter cuts reflection and balances exposure</li></ul>', 'filters polarizing-filter nd-filter light '),
(65, 1, '<ul><li>Shoot HDR</li><li>\r\nDynamic range is basically difference between the lightest light and darkest dark you can capture in a photo</li><li>\r\nNotoriously difficult to snap a photo that captures both ends of this spectrum</li></ul>', 'hdr light '),
(66, 1, '<ul><li>Use light to your advantage</li><li>\r\nDiffused light: softer than direct or natural light and produces less sharply-defined shadows on your subjects. It creates unique images by capturing details you may not see in harsher light. Good for portraits.</li><li>\r\nReflected Light: reflected from particular surface. Creates soft light.</li></ul>', 'portrait light  diffused reflected'),
(67, 1, '<ul><li>Use long exposure to control amount and duration of light</li><li>\r\nLong exposure photography is when we are using a much longer shutter speed to control amount and duration of light</li><li>\r\nShould use only when subject is stationary</li></ul>', 'long-exposure light '),
(68, 5, '<ul><li>Know your gear (min shutter speed to obtain sharp image how to quickly toggle max ISO that is acceptable)</li><li>  \r\nKnow your subject</li><li>  \r\nwork the light (sunrise and sunset)</li><li>  \r\nwhat the background (scan viewfinder for distracting objects)</li><li>  \r\nBe ethical</li><li>  \r\nObserve 3P''s Perseverance Patience and Planning</li><li>  \r\nBe ready for unexpected</li><li>  \r\nUse selective focus (widest aperture f/2.8)</li><li>  \r\nZoom In</li><li>  \r\nBurst Mode | Watch the eye (focus on eyes)</li></ul>', 'wildlife'),
(69, 3, '<ul><li>Is there a subject? Is the light good? Should be Yes</li><li>  \r\nStrong subject is a must (what you want to convey?)</li><li>  \r\nMake the light work (light should be interesting)</li><li>  \r\nHow to use the elements</li><li>  \r\nApply the rule of thirds</li><li>  \r\nMake your subject work</li><li>  \r\nEliminate Junk (too much of foreground bright spots) always check corner</li><li>  \r\nHorizontal or Vertical (try both ways and see which one is more pleasing)</li><li>  \r\nUse the right lens</li><li>  \r\nPhotograph less and Look more</li><li>  \r\nBe an Artist</li></ul>', 'landscape'),
(70, 2, '<ul><li>Plan and Prepare</li><li>\r\nPick the right location</li><li>\r\nWhat about the background</li><li>\r\nConnect with your subject</li><li>\r\nKnow your light</li><li>\r\nDirect your subject (keep example from 500px or Flickr)</li><li>\r\nCapture the narrative (absorb the story)</li><li>\r\nImperfections can create perfections</li><li>\r\nUse right tones textures and effects</li><li>\r\nEdit responsibly (donâ€™t create artificial looking image)</li></ul>', 'portrait '),
(71, 6, '<ul><li>Chose the right lens</li><li>\r\nMake it closer using extension tube</li><li>\r\nUse Aperture to control depth of field ( f/22 f/16 or f/2.8)</li><li>\r\nUse patterns for composition (no gaps at edges)</li><li>\r\nChoose right focus points</li><li>\r\nReview focus on LCD after every shot at 1:1 ratio check corners</li><li>\r\nUse raindrops or dew drops</li><li>\r\nUse different lights-  ambient/backlight/warm/cold</li><li>\r\nChoose the right backgrounds</li><li>\r\nUse elements like butterflies ladybugs etc</li></ul>', 'macro'),
(72, 7, '<ul><li>Blend and be really fast you have to be really fast</li><li>\r\nMost of your photographs will be terrible</li><li>\r\nUse small camera and short lenses shoot in Manual mode with lenses like 35mm-50mm</li><li>\r\nRule of 1/125 sec don''t let go shutter speed below 1/125 sec</li><li>\r\nYou have to like human beings</li><li>\r\nGet close 10 foot rule focus at 10 feet distance hang camera and click without looking at viewfinder to avoid people attention</li><li>\r\nUse different planes</li><li>\r\nChoose your environment</li><li>\r\nShoot at night</li><li>\r\nBe bold patient and respectful</li></ul>', 'street'),
(73, 8, '<ul><li>Visualise in black and white. pay attention to shadows lines and shapes</li><li>\r\nLook for contrast. some portion close to white and some close to black</li><li>\r\nWatch for textures</li><li>\r\nLook for patterns.</li><li>\r\nLong exposures love black and white. Use ND filters</li><li>\r\nB&W can soften the blow.</li><li>\r\nShoot in HDR. HDR is great for B&W</li><li>\r\nHSL is the secret sauce. Hue Saturation and Luminosity. Tweak colors in HSL panel in Photoshop or lightroom</li><li>\r\nPopular subjects : Portraits Architecture Street and Still Life</li></ul>', 'black-white'),
(74, 4, '<ul><li>Shutter stock legal document for Model : <a href="https://submit.shutterstock.com/legal" target="blank">Legal</a></li><li>\r\nSubmission guidelines <a href="https://www.shutterstock.com/contributorsupport/articles/kbat02/000006656" target="blank">Guidelines</a></li></ul>', 'shutter-stock'),
(75, 9, '<ul><li>Developing an image after it has been shot</li></ul>', 'post-processing'),
(76, 9, '<ul><li>Measurement between whitest whites and the blackest blacks and or the lowest and highest values of density and Luminance</li><li>\r\n1 f-stop = 6.02 db</li><li>\r\nA scene with a narrow dynamic range has much more subtle difference between highlights and shadow areas\r\n</li></ul>', 'dynamic-range'),
(77, 9, '<ul><li>Raw and Jpeg</li><li>\r\nRAW : is RAW data which is not processed and Exported out as JPEG</li><li>\r\nJPEG : compressed graphic format standard format Join Photographic Experts Group</li><li>\r\nJPEG Supports 24 bit color and is compressed using compression algorithm</li><li>\r\nJPEG can be created within the camera or from a software\r\n</li></ul> <ul><li>Raw Over Jpeg : </li><li>\r\n\r\nRAW gives highest quality</li><li>\r\nCamera does processing to convert RAW to JPEG</li><li>\r\nWith RAW you can process on your OWN and make a better decission</li><li>\r\nJPEG captures 8 bit RAW captures 12 bit or 14bit</li><li>\r\nHigher dynamic range</li></ul>', 'raw jpeg'),
(78, 9, '<ul><li>Adjust White Balance</li><li>\r\nWith RAW white balance is recorded but not applied. So it is easier to adjust</li><li>\r\nShooting RAW makes Wb adjustment easier\r\n</li></ul>', 'white-balance raw '),
(79, 9, '<ul><li>When you make adjustment and save again it loses quality. So if you edit JPEg you always have to be duplicating the image and saving out a new version, if you don''t want to lose the quality</li></ul>', 'jpeg '),
(80, 9, '<ul><li>What not to do ?<br/></li><li>\r\n\r\nDon''t ignore the histogram. Keep an eye while capturing post processing the image</li><li>\r\nAlso if histogram of a RAW file originally is not towards the desired ''bell curve'' discard that image in the beginning itself.</li><li>\r\nAlways try to get best exposure possible in camera</li><li>\r\nNoise and banding can show up</li><li>\r\n\r\nOver saturation:<br/>\r\nIt creates unnatural looking image<br/>\r\nIt''s tempting thing to do because a little bump in saturation and vibrance make such a big difference<br/>\r\nInstead consider selective color saturation</li><li>\r\n\r\nOver Sharpening:<br/>\r\nNever use sharpening to try to fix a photo that is out of focus or blurred<br/>\r\nAdding a bit of sharpening can make it extra crisp and realistic it can also make the images very textual and grungy</li><li>\r\n\r\nToo much Noise reduction<br/>\r\nFixing heavily noisy image will just degrade the quality and details of the image<br/>\r\nInstead shooting with wide aperture low ISO and slow shutter speed</li><li>\r\n\r\nUsing filters and Lens flair<br/>\r\nUsing filters and lens flair makes image very artificial and gives an over-processed look<br/>\r\nGive an unprofessional look amateurish feel and essence goes away</li><li>\r\n\r\nHDR Effect:<br/>\r\nNot understanding what HDR is and how it works in processing does more harm to the image than good<br/>\r\nHDR effect gives a grungy feel to image<br/>\r\nImages look animated</li><li>\r\n\r\nFixing Bad Images during Post-Processing<br/>\r\nGood processing can''t save bad images<br/>\r\nPictures taken in a bad light condition can not be corrected or fixed in Post-processing\r\n</li></ul>', 'post-processing  what-not-to-do'),
(81, 10, '<ul><li><a href="https://www.facebook.com/vc35photography/" target="blank">Facebook</a></li></ul><ul><li><a href="https://www.instagram.com/vc35photography/" target="blank">Instagram</a></li></ul><ul><li>\r\n<a href="https://www.flickr.com" target="blank">Flickr</a></li></ul><ul><li>\r\n<a href="http://contributor-accounts.shutterstock.com/" target="blank">ShutterStock</a></li></ul><ul><li>\r\n<a href="https://www.dreamstime.com/uploadfile" target="blank">DreamSite</a></li></ul><ul><li>\r\n<a href="https://contributors.gettyimages.com/" target="blank">iStock / Getty Images</a> </li></ul><ul><li>\r\n<a href="https://www.bigstockphoto.com/account/uploads/" target="blank">BigStock</a></li></ul>', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=124 ;

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
(65, 39, 'http://vc35photography.epizy.com/resources/WB8.JPG', '', '', 'Very early in the morning, almost darkness, 6-7 sec exposure. Very cold and Dark place. '),
(66, 48, 'https://www.photopills.com/sites/default/files/articles/2015/calobra_th.jpg', '', 'Moon as a dot, wide angle lens : Use a wide angle or a fish-eye lens (8-35mm) when you want to emphasize the beauty of the landscape', 'Nikon D700 | 14mm | f/2.8 |15s | ISO 200 | 10050K\r\n04/05/14 08:57pm | Sun elevation: -9.1Â° (Nautical Twilight) | Moon elevation: 53.8Â°'),
(67, 48, 'https://www.photopills.com/sites/default/files/articles/2015/lavall_th.jpg', '', 'Small moon, medium range focal length : By using short to medium focal lengths (50-200mm), the angle of view is narrower, increasing a little bit the size of the moon in the frame, and reducing the area of the landscape captured', 'Nikon 4Ds | 145mm | f/6.0 |1/8s | ISO 200 | 5850K\r\n07/12/14 09:26pm | Sun elevation: -2.8Â° (Golden Hour) | Moon elevation: 3.2Â°'),
(68, 48, 'https://www.photopills.com/sites/default/files/articles/2015/moonrise-al-toro_th.jpg', '', 'Big moon, long focal lengths : Finally, if you want the moon to be the main attraction in the photo, go for focal lengths of 400mm, 500mm and beyond.', 'Nikon D7100 | 500mm | f/5.0 |1s | ISO 400 | 5400K\r\n06/13/14 09:41pm | Sun elevation: -5.1Â° (Blue Hour) | Moon elevation: 1.3Â°\r\n'),
(70, 49, 'https://www.photopills.com/sites/default/files/articles/2015/moonrise-illa-aire_th.jpg', '', 'An interesting subject : It can be anything, a rock, a tree, a lighthouse, a building, an ancient construction', 'Nikon D7100 | 500mm | f/5.0 |1/500s | ISO 6350K\r\n05/14/14 08:45pm | Sun elevation: 0.8Â° (Golden Hour) | Moon elevation: 0.4Â°\r\n'),
(71, 50, 'https://www.photopills.com/sites/default/files/tutorials/2014/moon-viewfinder.jpg', '', '', ''),
(72, 50, 'https://www.photopills.com/sites/default/files/articles/2015/lluna-pont-bens_th.jpg', '', '', 'Nikon D300s | 500mm | f/5.0 |1/20s | ISO 800 | 65000K\r\n09/20/13 08:20pm | Sun elevation: -7.5Â° (Nautical Twilight) | Moon elevation: 1.4Â°'),
(73, 51, 'https://www.photopills.com/sites/default/files/tutorials/2014/barraca-nati.jpg', '', '', ''),
(74, 51, 'https://www.photopills.com/sites/default/files/tutorials/2014/sun-moon-elevation.jpg', '', '', 'the best time to shoot the moon is when the sun is at an elevation between 0.5â° and -6â°.'),
(75, 51, 'https://www.photopills.com/sites/default/files/tutorials/2014/favaritx-moon_0.jpg', '', '', 'When the sun is at an elevation between 0.5â° and -6â°, the moon has a beautiful yellow glow.\r\n'),
(76, 51, 'https://www.photopills.com/sites/default/files/tutorials/2014/planner-2_1.jpg', '', '', ''),
(77, 51, 'https://www.photopills.com/sites/default/files/tutorials/2014/planner-3_1.jpg', '', '', ''),
(78, 51, 'https://www.photopills.com/sites/default/files/tutorials/2014/planner-5_1.jpg', '', '', ''),
(79, 51, 'https://www.photopills.com/sites/default/files/tutorials/2014/moon-viewfinder.jpg', '', '', ''),
(80, 51, 'https://www.photopills.com/sites/default/files/articles/2018/photopills-rule-100-en_0.jpg', '', '', ''),
(81, 51, 'https://www.photopills.com/sites/default/files/tutorials/2014/planner-10_0.jpg', '', '', ''),
(82, 52, 'http://vc35photography.epizy.com/resources/HyperFocalDistance2.jpg', '', '', ''),
(83, 52, 'http://vc35photography.epizy.com/resources/HyperFocalDistance3.jpg', '', '', ''),
(84, 52, 'http://vc35photography.epizy.com/resources/HyperFocalDistance4.jpg', '', '', ''),
(85, 52, 'http://vc35photography.epizy.com/resources/HyperFocalDistance5.jpg', '', '', ''),
(86, 52, 'http://vc35photography.epizy.com/resources/HyperFocalDistance6.jpg', '', '', ''),
(87, 52, 'http://vc35photography.epizy.com/resources/HyperFocalDistance7.jpg', '', '', ''),
(88, 52, 'http://vc35photography.epizy.com/resources/HyperFocalDistance8.jpg', '', '', ''),
(89, 53, 'http://vc35photography.epizy.com/resources/Histogram1.JPG', '', '', ''),
(90, 53, 'http://vc35photography.epizy.com/resources/Histogram2.JPG', '', '', ''),
(91, 53, 'http://vc35photography.epizy.com/resources/Histogram3.JPG', '', '', 'On exposure 0 most of the data is at centre it is L curved'),
(92, 69, 'http://vc35photography.epizy.com/resources/Landscape1.JPG', '', '', ''),
(93, 69, 'http://vc35photography.epizy.com/resources/Landscape2.JPG', '', '', ''),
(94, 69, 'http://vc35photography.epizy.com/resources/Landscape3.JPG', '', '', ''),
(95, 69, 'http://vc35photography.epizy.com/resources/Landscape4.JPG', '', '', ''),
(96, 69, 'http://vc35photography.epizy.com/resources/Landscape5.JPG', '', '', ''),
(97, 69, 'http://vc35photography.epizy.com/resources/Landscape6.JPG', '', '', ''),
(98, 69, 'http://vc35photography.epizy.com/resources/Landscape7.JPG', '', '', ''),
(99, 69, 'http://vc35photography.epizy.com/resources/Landscape8.JPG', '', '', ''),
(100, 70, 'http://vc35photography.epizy.com/resources/Portrait1.JPG', '', '', ''),
(101, 70, 'http://vc35photography.epizy.com/resources/Portrait2.JPG', '', '', ''),
(102, 70, 'http://vc35photography.epizy.com/resources/Portrait3.JPG', '', '', ''),
(103, 70, 'http://vc35photography.epizy.com/resources/Portrait4.JPG', '', '', ''),
(104, 70, 'http://vc35photography.epizy.com/resources/Portrait5.JPG', '', '', ''),
(105, 71, 'http://vc35photography.epizy.com/resources/Macro1.JPG', '', '', 'f/4'),
(106, 71, 'http://vc35photography.epizy.com/resources/Macro2.JPG', '', '', 'early in morning , low light at background'),
(107, 71, 'http://vc35photography.epizy.com/resources/Macro3.JPG', '', '', 'extension tube used'),
(108, 71, 'http://vc35photography.epizy.com/resources/Macro4.JPG', '', '', ''),
(109, 71, 'http://vc35photography.epizy.com/resources/Macro5.JPG', '', '', 'done by 28-300 lens'),
(110, 72, 'http://vc35photography.epizy.com/resources/Street1.JPG', '', '', ''),
(111, 72, 'http://vc35photography.epizy.com/resources/Street2.JPG', '', '', ''),
(112, 72, 'http://vc35photography.epizy.com/resources/Street3.JPG', '', '', ''),
(113, 72, 'http://vc35photography.epizy.com/resources/Street4.JPG', '', '', ''),
(114, 72, 'http://vc35photography.epizy.com/resources/Street5.JPG', '', '', ''),
(115, 72, 'http://vc35photography.epizy.com/resources/Street6.JPG', '', '', ''),
(116, 73, 'http://vc35photography.epizy.com/resources/B&W1.JPG', '', '', ''),
(117, 73, 'http://vc35photography.epizy.com/resources/B&W2.JPG', '', '', ''),
(118, 73, 'http://vc35photography.epizy.com/resources/B&W3.JPG', '', '', 'Long exposure'),
(119, 73, 'http://vc35photography.epizy.com/resources/B&W4.JPG', '', '', 'Long exposure'),
(120, 73, 'http://vc35photography.epizy.com/resources/B&W5.JPG', '', '', ''),
(121, 73, 'http://vc35photography.epizy.com/resources/B&W6.JPG', '', '', ''),
(122, 73, 'http://vc35photography.epizy.com/resources/B&W7.JPG', '', '', 'Long exposure with ND filter'),
(123, 73, 'http://vc35photography.epizy.com/resources/B&W8.JPG', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `passWord1` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `username`, `passWord1`, `salt`, `active`) VALUES
(1, 'admin', '9884fead145f1c7e92a5e532b0dbf18dfbd2e5f2', '$%^7**', 1),
(2, 'guest', 'c4dd04dfccc12a1914956aa9d1ed7ac16dc5a10b', 'YXWCKdedHJ', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
