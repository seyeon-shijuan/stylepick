-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.4.12-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- stylepick 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `stylepick` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `stylepick`;

-- 테이블 stylepick.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `no` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `stat` varchar(50) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `readcnt` int(11) DEFAULT 0,
  `content` text DEFAULT NULL,
  `file1` varchar(100) DEFAULT NULL,
  `openstatus` tinyint(1) DEFAULT NULL,
  `mail` tinyint(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.board:~19 rows (대략적) 내보내기
DELETE FROM `board`;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`no`, `title`, `author`, `seq`, `category`, `stat`, `regtime`, `readcnt`, `content`, `file1`, `openstatus`, `mail`, `email`) VALUES
	(1, '사이트 이용방법 안내', 'admin', 1, NULL, NULL, '2020-08-18 14:18:18', 2, '환경권의 내용과 행사에 관하여는 법률로 정한다. 국회의원은 그 지위를 남용하여 국가·공공단체 또는 기업체와의 계약이나 그 처분에 의하여 재산상의 권리·이익 또는 직위를 취득하거나 타인을 위하여 그 취득을 알선할 수 없다.\r\n\r\n나는 헌법을 준수하고 국가를 보위하며 조국의 평화적 통일과 국민의 자유와 복리의 증진 및 민족문화의 창달에 노력하여 대통령으로서의 직책을 성실히 수행할 것을 국민 앞에 엄숙히 선서합니다.\r\n\r\n국가는 주택개발정책등을 통하여 모든 국민이 쾌적한 주거생활을 할 수 있도록 노력하여야 한다. 이 헌법중 공무원의 임기 또는 중임제한에 관한 규정은 이 헌법에 의하여 그 공무원이 최초로 선출 또는 임명된 때로부터 적용한다.\r\n\r\n모든 국민은 법률이 정하는 바에 의하여 국가기관에 문서로 청원할 권리를 가진다. 국회의원이 회기전에 체포 또는 구금된 때에는 현행범인이 아닌 한 국회의 요구가 있으면 회기중 석방된다.\r\n\r\n헌법에 의하여 체결·공포된 조약과 일반적으로 승인된 국제법규는 국내법과 같은 효력을 가진다. 모든 국민은 보건에 관하여 국가의 보호를 받는다. 국민의 자유와 권리는 헌법에 열거되지 아니한 이유로 경시되지 아니한다.\r\n\r\n정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다. 국가는 청원에 대하여 심사할 의무를 진다.\r\n\r\n국가는 노인과 청소년의 복지향상을 위한 정책을 실시할 의무를 진다. 행정권은 대통령을 수반으로 하는 정부에 속한다. 모든 국민은 근로의 의무를 진다. 국가는 근로의 의무의 내용과 조건을 민주주의원칙에 따라 법률로 정한다.\r\n\r\n법관은 헌법과 법률에 의하여 그 양심에 따라 독립하여 심판한다. 국회에 제출된 법률안 기타의 의안은 회기중에 의결되지 못한 이유로 폐기되지 아니한다. 다만, 국회의원의 임기가 만료된 때에는 그러하지 아니하다.\r\n\r\n대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다.\r\n\r\n헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다. 제2항과 제3항의 처분에 대하여는 법원에 제소할 수 없다.\r\n\r\n국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 외국인은 국제법과 조약이 정하는 바에 의하여 그 지위가 보장된다. 새로운 회계연도가 개시될 때까지 예산안이 의결되지 못한 때에는 정부는 국회에서 예산안이 의결될 때까지 다음의 목적을 위한 경비는 전년도 예산에 준하여 집행할 수 있다.\r\n\r\n모든 국민은 주거의 자유를 침해받지 아니한다. 주거에 대한 압수나 수색을 할 때에는 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. 모든 국민은 사생활의 비밀과 자유를 침해받지 아니한다.\r\n\r\n지방자치단체는 주민의 복리에 관한 사무를 처리하고 재산을 관리하며, 법령의 범위안에서 자치에 관한 규정을 제정할 수 있다. 군사재판을 관할하기 위하여 특별법원으로서 군사법원을 둘 수 있다.\r\n\r\n대법원과 각급법원의 조직은 법률로 정한다. 국가는 농지에 관하여 경자유전의 원칙이 달성될 수 있도록 노력하여야 하며, 농지의 소작제도는 금지된다.\r\n\r\n한 회계연도를 넘어 계속하여 지출할 필요가 있을 때에는 정부는 연한을 정하여 계속비로서 국회의 의결을 얻어야 한다. 공무원은 국민전체에 대한 봉사자이며, 국민에 대하여 책임을 진다.\r\n\r\n국군의 조직과 편성은 법률로 정한다. 대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 국회의원은 현행범인인 경우를 제외하고는 회기중 국회의 동의없이 체포 또는 구금되지 아니한다.\r\n\r\n대통령은 취임에 즈음하여 다음의 선서를 한다. 대통령은 국무총리·국무위원·행정각부의 장 기타 법률이 정하는 공사의 직을 겸할 수 없다. 국가는 평생교육을 진흥하여야 한다.\r\n\r\n국가는 과학기술의 혁신과 정보 및 인력의 개발을 통하여 국민경제의 발전에 노력하여야 한다. 국회의원은 국회에서 직무상 행한 발언과 표결에 관하여 국회외에서 책임을 지지 아니한다.\r\n\r\n모든 국민은 능력에 따라 균등하게 교육을 받을 권리를 가진다. 탄핵결정은 공직으로부터 파면함에 그친다. 그러나, 이에 의하여 민사상이나 형사상의 책임이 면제되지는 아니한다.\r\n\r\n대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다. 대법원장은 국회의 동의를 얻어 대통령이 임명한다.', NULL, 1, 0, NULL),
	(2, '새로운 기능이 추가되었습니다.', 'admin', 1, NULL, NULL, '2020-08-18 16:01:59', 3, '국회에 제출된 법률안 기타의 의안은 회기중에 의결되지 못한 이유로 폐기되지 아니한다. 다만, 국회의원의 임기가 만료된 때에는 그러하지 아니하다. 제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다.\r\n\r\n대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 대통령은 취임에 즈음하여 다음의 선서를 한다. 타인의 범죄행위로 인하여 생명·신체에 대한 피해를 받은 국민은 법률이 정하는 바에 의하여 국가로부터 구조를 받을 수 있다.\r\n\r\n국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 대통령은 헌법과 법률이 정하는 바에 의하여 국군을 통수한다. 법률이 정하는 주요방위산업체에 종사하는 근로자의 단체행동권은 법률이 정하는 바에 의하여 이를 제한하거나 인정하지 아니할 수 있다.\r\n\r\n모든 국민은 보건에 관하여 국가의 보호를 받는다. 선거에 있어서 최고득표자가 2인 이상인 때에는 국회의 재적의원 과반수가 출석한 공개회의에서 다수표를 얻은 자를 당선자로 한다.\r\n\r\n대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 사생활의 비밀과 자유를 침해받지 아니한다. 국가원로자문회의의 의장은 직전대통령이 된다. 다만, 직전대통령이 없을 때에는 대통령이 지명한다.\r\n\r\n사회적 특수계급의 제도는 인정되지 아니하며, 어떠한 형태로도 이를 창설할 수 없다. 국민경제자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다.\r\n\r\n모든 국민은 소급입법에 의하여 참정권의 제한을 받거나 재산권을 박탈당하지 아니한다. 의무교육은 무상으로 한다. 국무총리는 국회의 동의를 얻어 대통령이 임명한다.\r\n\r\n모든 국민은 학문과 예술의 자유를 가진다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 국가는 재해를 예방하고 그 위험으로부터 국민을 보호하기 위하여 노력하여야 한다.\r\n\r\n원장은 국회의 동의를 얻어 대통령이 임명하고, 그 임기는 4년으로 하며, 1차에 한하여 중임할 수 있다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다.\r\n\r\n대법관의 임기는 6년으로 하며, 법률이 정하는 바에 의하여 연임할 수 있다. 국가는 평생교육을 진흥하여야 한다. 대통령이 제1항의 기간내에 공포나 재의의 요구를 하지 아니한 때에도 그 법률안은 법률로서 확정된다.\r\n\r\n국가안전보장회의는 대통령이 주재한다. 제2항과 제3항의 처분에 대하여는 법원에 제소할 수 없다. 대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다.\r\n\r\n국회는 상호원조 또는 안전보장에 관한 조약, 중요한 국제조직에 관한 조약, 우호통상항해조약, 주권의 제약에 관한 조약, 강화조약, 국가나 국민에게 중대한 재정적 부담을 지우는 조약 또는 입법사항에 관한 조약의 체결·비준에 대한 동의권을 가진다.\r\n\r\n국가는 국민 모두의 생산 및 생활의 기반이 되는 국토의 효율적이고 균형있는 이용·개발과 보전을 위하여 법률이 정하는 바에 의하여 그에 관한 필요한 제한과 의무를 과할 수 있다.\r\n\r\n모든 국민은 헌법과 법률이 정한 법관에 의하여 법률에 의한 재판을 받을 권리를 가진다. 농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다.\r\n\r\n대법원장과 대법관이 아닌 법관의 임기는 10년으로 하며, 법률이 정하는 바에 의하여 연임할 수 있다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다.\r\n\r\n계엄을 선포한 때에는 대통령은 지체없이 국회에 통고하여야 한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다.\r\n\r\n국가는 노인과 청소년의 복지향상을 위한 정책을 실시할 의무를 진다. 국군은 국가의 안전보장과 국토방위의 신성한 의무를 수행함을 사명으로 하며, 그 정치적 중립성은 준수된다.\r\n\r\n모든 국민은 신속한 재판을 받을 권리를 가진다. 형사피고인은 상당한 이유가 없는 한 지체없이 공개재판을 받을 권리를 가진다. 사면·감형 및 복권에 관한 사항은 법률로 정한다.\r\n\r\n대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 정기회의 회기는 100일을, 임시회의 회기는 30일을 초과할 수 없다. 연소자의 근로는 특별한 보호를 받는다.\r\n\r\n대통령의 임기는 5년으로 하며, 중임할 수 없다. 헌법개정은 국회재적의원 과반수 또는 대통령의 발의로 제안된다. 국가는 주택개발정책등을 통하여 모든 국민이 쾌적한 주거생활을 할 수 있도록 노력하여야 한다.', NULL, 1, 0, NULL),
	(3, '개인정보 처리 규정 변경 안내', 'admin', 1, NULL, NULL, '2020-08-19 17:53:18', 2, '모든 국민은 사생활의 비밀과 자유를 침해받지 아니한다. 헌법개정은 국회재적의원 과반수 또는 대통령의 발의로 제안된다. 국가는 사회보장·사회복지의 증진에 노력할 의무를 진다.\r\n\r\n비상계엄이 선포된 때에는 법률이 정하는 바에 의하여 영장제도, 언론·출판·집회·결사의 자유, 정부나 법원의 권한에 관하여 특별한 조치를 할 수 있다.\r\n\r\n언론·출판에 대한 허가나 검열과 집회·결사에 대한 허가는 인정되지 아니한다. 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 국민의 모든 자유와 권리는 국가안전보장·질서유지 또는 공공복리를 위하여 필요한 경우에 한하여 법률로써 제한할 수 있으며, 제한하는 경우에도 자유와 권리의 본질적인 내용을 침해할 수 없다.\r\n\r\n국회는 법률에 저촉되지 아니하는 범위안에서 의사와 내부규율에 관한 규칙을 제정할 수 있다. 국회의원은 그 지위를 남용하여 국가·공공단체 또는 기업체와의 계약이나 그 처분에 의하여 재산상의 권리·이익 또는 직위를 취득하거나 타인을 위하여 그 취득을 알선할 수 없다.\r\n\r\n재산권의 행사는 공공복리에 적합하도록 하여야 한다. 대통령은 법률에서 구체적으로 범위를 정하여 위임받은 사항과 법률을 집행하기 위하여 필요한 사항에 관하여 대통령령을 발할 수 있다.\r\n\r\n법원은 최고법원인 대법원과 각급법원으로 조직된다. 모든 국민은 인간다운 생활을 할 권리를 가진다. 국가원로자문회의의 의장은 직전대통령이 된다. 다만, 직전대통령이 없을 때에는 대통령이 지명한다.\r\n\r\n대통령은 내우·외환·천재·지변 또는 중대한 재정·경제상의 위기에 있어서 국가의 안전보장 또는 공공의 안녕질서를 유지하기 위하여 긴급한 조치가 필요하고 국회의 집회를 기다릴 여유가 없을 때에 한하여 최소한으로 필요한 재정·경제상의 처분을 하거나 이에 관하여 법률의 효력을 가지는 명령을 발할 수 있다.\r\n\r\n정당의 설립은 자유이며, 복수정당제는 보장된다. 대통령의 국법상 행위는 문서로써 하며, 이 문서에는 국무총리와 관계 국무위원이 부서한다. 군사에 관한 것도 또한 같다.\r\n\r\n대통령은 헌법과 법률이 정하는 바에 의하여 국군을 통수한다. 계엄을 선포한 때에는 대통령은 지체없이 국회에 통고하여야 한다. 국회는 상호원조 또는 안전보장에 관한 조약, 중요한 국제조직에 관한 조약, 우호통상항해조약, 주권의 제약에 관한 조약, 강화조약, 국가나 국민에게 중대한 재정적 부담을 지우는 조약 또는 입법사항에 관한 조약의 체결·비준에 대한 동의권을 가진다.\r\n\r\n대통령의 선거에 관한 사항은 법률로 정한다. 모든 국민은 근로의 의무를 진다. 국가는 근로의 의무의 내용과 조건을 민주주의원칙에 따라 법률로 정한다.\r\n\r\n국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 제1항의 탄핵소추는 국회재적의원 3분의 1 이상의 발의가 있어야 하며, 그 의결은 국회재적의원 과반수의 찬성이 있어야 한다. 다만, 대통령에 대한 탄핵소추는 국회재적의원 과반수의 발의와 국회재적의원 3분의 2 이상의 찬성이 있어야 한다.\r\n\r\n각급 선거관리위원회의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 감사원은 세입·세출의 결산을 매년 검사하여 대통령과 차년도국회에 그 결과를 보고하여야 한다.\r\n\r\n국회에 제출된 법률안 기타의 의안은 회기중에 의결되지 못한 이유로 폐기되지 아니한다. 다만, 국회의원의 임기가 만료된 때에는 그러하지 아니하다. 선거와 국민투표의 공정한 관리 및 정당에 관한 사무를 처리하기 위하여 선거관리위원회를 둔다.\r\n\r\n학교교육 및 평생교육을 포함한 교육제도와 그 운영, 교육재정 및 교원의 지위에 관한 기본적인 사항은 법률로 정한다. 헌법개정안이 제2항의 찬성을 얻은 때에는 헌법개정은 확정되며, 대통령은 즉시 이를 공포하여야 한다.\r\n\r\n국교는 인정되지 아니하며, 종교와 정치는 분리된다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다.\r\n\r\n대법원장은 국회의 동의를 얻어 대통령이 임명한다. 교육의 자주성·전문성·정치적 중립성 및 대학의 자율성은 법률이 정하는 바에 의하여 보장된다. 헌법에 의하여 체결·공포된 조약과 일반적으로 승인된 국제법규는 국내법과 같은 효력을 가진다.\r\n\r\n대통령은 필요하다고 인정할 때에는 외교·국방·통일 기타 국가안위에 관한 중요정책을 국민투표에 붙일 수 있다. 대통령은 국무회의의 의장이 되고, 국무총리는 부의장이 된다.\r\n\r\n모든 국민은 신속한 재판을 받을 권리를 가진다. 형사피고인은 상당한 이유가 없는 한 지체없이 공개재판을 받을 권리를 가진다. 재판의 전심절차로서 행정심판을 할 수 있다. 행정심판의 절차는 법률로 정하되, 사법절차가 준용되어야 한다.\r\n\r\n대한민국의 국민이 되는 요건은 법률로 정한다. 사법권은 법관으로 구성된 법원에 속한다. 언론·출판은 타인의 명예나 권리 또는 공중도덕이나 사회윤리를 침해하여서는 아니된다. 언론·출판이 타인의 명예나 권리를 침해한 때에는 피해자는 이에 대한 피해의 배상을 청구할 수 있다.\r\n\r\n', NULL, 1, 0, NULL),
	(4, '광고성 게시글 삭제 관련 공지', 'admin', 1, NULL, NULL, '2020-08-20 13:40:02', 2, '국가유공자·상이군경 및 전몰군경의 유가족은 법률이 정하는 바에 의하여 우선적으로 근로의 기회를 부여받는다. 법률안에 이의가 있을 때에는 대통령은 제1항의 기간내에 이의서를 붙여 국회로 환부하고, 그 재의를 요구할 수 있다. 국회의 폐회중에도 또한 같다.\r\n\r\n모든 국민은 신체의 자유를 가진다. 누구든지 법률에 의하지 아니하고는 체포·구속·압수·수색 또는 심문을 받지 아니하며, 법률과 적법한 절차에 의하지 아니하고는 처벌·보안처분 또는 강제노역을 받지 아니한다.\r\n\r\n군인은 현역을 면한 후가 아니면 국무위원으로 임명될 수 없다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다.\r\n\r\n국회는 정부의 동의없이 정부가 제출한 지출예산 각항의 금액을 증가하거나 새 비목을 설치할 수 없다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.\r\n\r\n누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 정당의 설립은 자유이며, 복수정당제는 보장된다. 예비비는 총액으로 국회의 의결을 얻어야 한다. 예비비의 지출은 차기국회의 승인을 얻어야 한다.\r\n\r\n대한민국의 경제질서는 개인과 기업의 경제상의 자유와 창의를 존중함을 기본으로 한다. 공무원인 근로자는 법률이 정하는 자에 한하여 단결권·단체교섭권 및 단체행동권을 가진다.\r\n\r\n대법원장과 대법관이 아닌 법관의 임기는 10년으로 하며, 법률이 정하는 바에 의하여 연임할 수 있다. 이 헌법시행 당시의 법령과 조약은 이 헌법에 위배되지 아니하는 한 그 효력을 지속한다.\r\n\r\n국가는 농수산물의 수급균형과 유통구조의 개선에 노력하여 가격안정을 도모함으로써 농·어민의 이익을 보호한다. 국민경제자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다.\r\n\r\n헌법개정은 국회재적의원 과반수 또는 대통령의 발의로 제안된다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 계엄을 선포한 때에는 대통령은 지체없이 국회에 통고하여야 한다.\r\n\r\n대통령은 조약을 체결·비준하고, 외교사절을 신임·접수 또는 파견하며, 선전포고와 강화를 한다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다.\r\n\r\n통신·방송의 시설기준과 신문의 기능을 보장하기 위하여 필요한 사항은 법률로 정한다. 국회는 국가의 예산안을 심의·확정한다. 군인·군무원·경찰공무원 기타 법률이 정하는 자가 전투·훈련등 직무집행과 관련하여 받은 손해에 대하여는 법률이 정하는 보상외에 국가 또는 공공단체에 공무원의 직무상 불법행위로 인한 배상은 청구할 수 없다.\r\n\r\n비상계엄하의 군사재판은 군인·군무원의 범죄나 군사에 관한 간첩죄의 경우와 초병·초소·유독음식물공급·포로에 관한 죄중 법률이 정한 경우에 한하여 단심으로 할 수 있다. 다만, 사형을 선고한 경우에는 그러하지 아니하다.\r\n\r\n국무총리·국무위원 또는 정부위원은 국회나 그 위원회에 출석하여 국정처리상황을 보고하거나 의견을 진술하고 질문에 응답할 수 있다. 평화통일정책의 수립에 관한 대통령의 자문에 응하기 위하여 민주평화통일자문회의를 둘 수 있다.\r\n\r\n모든 국민은 직업선택의 자유를 가진다. 헌법재판소 재판관은 정당에 가입하거나 정치에 관여할 수 없다. 행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다.\r\n\r\n모든 국민은 인간으로서의 존엄과 가치를 가지며, 행복을 추구할 권리를 가진다. 국가는 개인이 가지는 불가침의 기본적 인권을 확인하고 이를 보장할 의무를 진다.\r\n\r\n공개하지 아니한 회의내용의 공표에 관하여는 법률이 정하는 바에 의한다. 선거에 있어서 최고득표자가 2인 이상인 때에는 국회의 재적의원 과반수가 출석한 공개회의에서 다수표를 얻은 자를 당선자로 한다.\r\n\r\n국민의 자유와 권리는 헌법에 열거되지 아니한 이유로 경시되지 아니한다. 국정의 중요한 사항에 관한 대통령의 자문에 응하기 위하여 국가원로로 구성되는 국가원로자문회의를 둘 수 있다.\r\n\r\n헌법재판소의 장은 국회의 동의를 얻어 재판관중에서 대통령이 임명한다. 헌법재판소 재판관의 임기는 6년으로 하며, 법률이 정하는 바에 의하여 연임할 수 있다.\r\n\r\n대통령은 필요하다고 인정할 때에는 외교·국방·통일 기타 국가안위에 관한 중요정책을 국민투표에 붙일 수 있다. 국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다.\r\n\r\n', NULL, 1, 0, NULL),
	(5, '이제 네이버 페이를 이용해서 결제하실 수 있습니다.', 'admin', 1, NULL, NULL, '2020-08-21 14:57:27', 3, '제곧내', NULL, 1, 0, NULL),
	(6, '이제 네이버 페이만 이용해서 결제하실 수 있습니다.', 'admin', 1, NULL, NULL, '2020-08-21 17:01:20', 2, '감사합니다.', NULL, 1, 0, NULL),
	(7, '구매한 상품을 환불하고 싶어요', 'admin', 3, '구매,상품,환불', NULL, '2020-08-21 17:03:59', 2, '죄송합니다.', NULL, 1, 0, NULL),
	(8, '판매할 상품은 어디서 등록하나요?', 'admin', 3, '판매,상품,등록', NULL, '2020-08-21 17:06:12', 1, '1. 왼쪽 상단의 프로필 아이콘 클릭\r\n2. 판매자 페이지로 이동\r\n2. 상품등록 버튼 클릭', NULL, 1, 0, NULL),
	(9, '판매자로 등록하려면 어떻게 해야되나요?', 'admin', 3, '판매,판매자,등록', NULL, '2020-08-21 17:08:38', 1, '1. 로그인 후 화면 오른쪽 상단의 판매자 등록 클릭\r\n2. 양식 작성 후 판매자 등록', NULL, 1, 0, NULL),
	(10, '판매자 정보를 수정하고 싶어요', 'admin', 3, '판매,판매자,수정', NULL, '2020-08-21 17:10:09', 0, '1. 로그인 후 화면 오른쪽 상단의 판매자 정보 수정 클릭\r\n2. 변경할 내용 입력 후 저장', NULL, 1, 0, NULL),
	(11, '팔로우 기능은 어떻게 이용하나요?', 'admin', 3, 'OOTD,소셜,팔로우', NULL, '2020-08-21 17:15:41', 1, '팔로우 할 사람의 OOTD를 클릭하면 팔로우 버튼이 있습니다.', NULL, 1, 0, NULL),
	(12, '키와 몸무게를 꼭 적어야 하나요?', 'admin', 3, 'OOTD,등록,개인정보', NULL, '2020-08-21 17:21:05', 0, '공개를 원치 않으시면 적지 않으셔도 등록이 가능합니다.', NULL, 1, 0, NULL),
	(13, '배송지를 잘못 적었어요', 'admin', 3, '구매,상품,배송', NULL, '2020-08-27 17:25:13', 0, '판매자에게 문의하시길 바랍니다.', NULL, 1, 0, NULL),
	(14, '회원 탈퇴는 어디서 하나요?', 'admin', 3, '기타,사이트,회원', NULL, '2020-08-27 17:27:28', 2, '이 헌법중 공무원의 임기 또는 중임제한에 관한 규정은 이 헌법에 의하여 그 공무원이 최초로 선출 또는 임명된 때로부터 적용한다. 피고인의 자백이 고문·폭행·협박·구속의 부당한 장기화 또는 기망 기타의 방법에 의하여 자의로 진술된 것이 아니라고 인정될 때 또는 정식재판에 있어서 피고인의 자백이 그에게 불리한 유일한 증거일 때에는 이를 유죄의 증거로 삼거나 이를 이유로 처벌할 수 없다.\r\n\r\n감사원의 조직·직무범위·감사위원의 자격·감사대상공무원의 범위 기타 필요한 사항은 법률로 정한다. 국가는 건전한 소비행위를 계도하고 생산품의 품질향상을 촉구하기 위한 소비자보호운동을 법률이 정하는 바에 의하여 보장한다.\r\n\r\n대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다.\r\n\r\n모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 대통령은 국민의 보통·평등·직접·비밀선거에 의하여 선출한다. 대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다.\r\n\r\n국가안전보장회의는 대통령이 주재한다. 근로자는 근로조건의 향상을 위하여 자주적인 단결권·단체교섭권 및 단체행동권을 가진다. 모든 국민은 자기의 행위가 아닌 친족의 행위로 인하여 불이익한 처우를 받지 아니한다.\r\n\r\n제2항의 재판관중 3인은 국회에서 선출하는 자를, 3인은 대법원장이 지명하는 자를 임명한다. 대통령의 임기는 5년으로 하며, 중임할 수 없다. 새로운 회계연도가 개시될 때까지 예산안이 의결되지 못한 때에는 정부는 국회에서 예산안이 의결될 때까지 다음의 목적을 위한 경비는 전년도 예산에 준하여 집행할 수 있다.\r\n\r\n헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며, 재판관은 대통령이 임명한다. 재판의 심리와 판결은 공개한다. 다만, 심리는 국가의 안전보장 또는 안녕질서를 방해하거나 선량한 풍속을 해할 염려가 있을 때에는 법원의 결정으로 공개하지 아니할 수 있다.\r\n\r\n국회의원과 정부는 법률안을 제출할 수 있다. 환경권의 내용과 행사에 관하여는 법률로 정한다. 재판의 전심절차로서 행정심판을 할 수 있다. 행정심판의 절차는 법률로 정하되, 사법절차가 준용되어야 한다.\r\n\r\n대통령후보자가 1인일 때에는 그 득표수가 선거권자 총수의 3분의 1 이상이 아니면 대통령으로 당선될 수 없다. 국채를 모집하거나 예산외에 국가의 부담이 될 계약을 체결하려 할 때에는 정부는 미리 국회의 의결을 얻어야 한다.\r\n\r\n이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다.\r\n\r\n국가는 평생교육을 진흥하여야 한다. 군인은 현역을 면한 후가 아니면 국무위원으로 임명될 수 없다. 모든 국민은 법률이 정하는 바에 의하여 국가기관에 문서로 청원할 권리를 가진다.\r\n\r\n모든 국민은 건강하고 쾌적한 환경에서 생활할 권리를 가지며, 국가와 국민은 환경보전을 위하여 노력하여야 한다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다.\r\n\r\n헌법개정은 국회재적의원 과반수 또는 대통령의 발의로 제안된다. 대통령의 국법상 행위는 문서로써 하며, 이 문서에는 국무총리와 관계 국무위원이 부서한다. 군사에 관한 것도 또한 같다.\r\n\r\n모든 국민은 법률이 정하는 바에 의하여 납세의 의무를 진다. 공무원은 국민전체에 대한 봉사자이며, 국민에 대하여 책임을 진다. 대통령은 국회에 출석하여 발언하거나 서한으로 의견을 표시할 수 있다.\r\n\r\n모든 국민의 재산권은 보장된다. 그 내용과 한계는 법률로 정한다. 재의의 요구가 있을 때에는 국회는 재의에 붙이고, 재적의원과반수의 출석과 출석의원 3분의 2 이상의 찬성으로 전과 같은 의결을 하면 그 법률안은 법률로서 확정된다.\r\n\r\n비상계엄하의 군사재판은 군인·군무원의 범죄나 군사에 관한 간첩죄의 경우와 초병·초소·유독음식물공급·포로에 관한 죄중 법률이 정한 경우에 한하여 단심으로 할 수 있다. 다만, 사형을 선고한 경우에는 그러하지 아니하다.\r\n\r\n국회의원이 회기전에 체포 또는 구금된 때에는 현행범인이 아닌 한 국회의 요구가 있으면 회기중 석방된다. 헌법개정안이 제2항의 찬성을 얻은 때에는 헌법개정은 확정되며, 대통령은 즉시 이를 공포하여야 한다.\r\n\r\n선거에 관한 경비는 법률이 정하는 경우를 제외하고는 정당 또는 후보자에게 부담시킬 수 없다. 대통령의 임기가 만료되는 때에는 임기만료 70일 내지 40일전에 후임자를 선거한다.\r\n\r\n모든 국민은 학문과 예술의 자유를 가진다. 법률은 특별한 규정이 없는 한 공포한 날로부터 20일을 경과함으로써 효력을 발생한다. 대통령은 국가의 독립·영토의 보전·국가의 계속성과 헌법을 수호할 책무를 진다.\r\n\r\n재산권의 행사는 공공복리에 적합하도록 하여야 한다. 타인의 범죄행위로 인하여 생명·신체에 대한 피해를 받은 국민은 법률이 정하는 바에 의하여 국가로부터 구조를 받을 수 있다.', NULL, 1, 0, NULL),
	(15, '찾는 질문이 FAQ에 없어요', 'admin', 3, '기타,사이트,문의', NULL, '2020-08-27 17:28:47', 1, 'Q&A로 직접 질문을 등록하실 수 있습니다.', NULL, 1, 0, NULL),
	(16, '구매 정보는 어디서 볼 수 있나요?', '비회원', 2, '구매', 'wait', '2020-08-27 17:40:02', 1, '자세한 구매 정보를 볼 수 있나요?', NULL, 1, 1, 'nonmember@shop.com'),
	(17, '비밀번호를 잊어버렸어요', '비회원', 2, '기타', 'wait', '2020-08-27 17:42:22', 0, '답장 부탁드립니다.', NULL, 1, 1, 'nonmember@spick.com'),
	(18, '팔로우 관련 문의드립니다', 'jennie', 2, 'OOTD', 'wait', '2020-08-27 17:44:57', 0, '저를 팔로우한 사람들 목록을 볼 수 있나요?', NULL, 1, 0, ''),
	(19, '배송일을 알고 싶어요', 'jieun', 2, '구매', 'wait', '2020-08-27 17:53:25', 1, '오늘 주문한 상품의 배송일을 알고싶습니다', NULL, 1, 1, '');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 stylepick.buy 구조 내보내기
CREATE TABLE IF NOT EXISTS `buy` (
  `order_no` int(100) NOT NULL COMMENT '주문번호',
  `userid` varchar(20) NOT NULL DEFAULT '' COMMENT '회원아이디',
  `name` varchar(20) NOT NULL COMMENT '수령자이름',
  `address` varchar(100) NOT NULL COMMENT '수령지주소',
  `tel` varchar(30) NOT NULL COMMENT '수령자번호',
  `orderdate` datetime NOT NULL COMMENT '주문날짜',
  `amount` int(100) NOT NULL COMMENT '총 금액',
  `memo` varchar(200) DEFAULT NULL COMMENT '배송메모'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.buy:~35 rows (대략적) 내보내기
DELETE FROM `buy`;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` (`order_no`, `userid`, `name`, `address`, `tel`, `orderdate`, `amount`, `memo`) VALUES
	(1, 'admin', '관리자', '안산시', '12345678', '2019-01-12 17:58:39', 20000, NULL),
	(2, 'jennie', '김제니', '서울시 양천구 목동서로 100 목동아파트 325-301', '821030000000', '2020-05-01 17:58:39', 10000, NULL),
	(3, 'gaeun', '이가은', '서울시 양천구 신정6동 목동아파트 1422-2001', '8210405245454', '2020-06-05 02:58:39', 30000, NULL),
	(4, 'rosie', '박채영', '서울시 강서구 양천로75길 22-21 이너스내안에 101-401', '82104052454400', '2020-08-05 02:58:39', 50000, NULL),
	(5, 'maxime', '맥스', '서울시 성동구 성수동1가 718 트리마제 101-1702', '821045454544', '2020-08-10 02:58:39', 100000, NULL),
	(6, 'stefan', '스테판', '서울시 성동구 성수동1가 718 트리마제 101-1702', '821045454544', '2020-08-10 02:58:39', 2500, NULL),
	(7, 'jieun', '이지은', '서울시 양천구 목동 962-1 목동트라팰리스이스턴에비뉴 A동4001호', '821000004545', '2020-08-11 02:58:39', 35000, NULL),
	(8, 'gaeun', '이가은', '서울시 양천구 신정6동 목동아파트 1422-2001', '8210405245454', '2020-08-15 02:58:39', 1000, NULL),
	(9, 'gaeun', '이가은', '서울시 양천구 신정6동 목동아파트 1422-2001', '8210405245454', '2020-08-16 02:58:39', 40000, NULL),
	(10, 'rosie', '박채영', '서울시 강서구 양천로75길 22-21 이너스내안에 101-401', '82104052454400', '2020-08-17 02:58:39', 15000, NULL),
	(11, 'admin', '관리자', '서울시 금천구', '01023546879', '2020-08-21 18:15:33', 30000, NULL),
	(12, 'rosie', 'aaa', '07803 서울 강서구 강서로 375 (마곡동) bbb', '123', '2020-08-22 16:17:05', 80000, 'ccc'),
	(13, 'jennie', 'aaa', '07810 서울 강서구 마곡서로 9 (마곡동) bbb', '123', '2020-08-22 17:19:28', 60450, 'ccc'),
	(14, 'gaeun', 'a', '48060 부산 해운대구 APEC로 17 (우동) bbb', '123', '2020-08-23 17:20:54', 60700, 'asdfasdfasdf'),
	(15, 'stefan', 'aaa', '07803 서울 강서구 강서로 375 (마곡동) ab', '123', '2020-08-23 17:29:24', 34500, 'ccd'),
	(16, 'jieun', 'aaa', '48060 부산 해운대구 APEC로 17 (우동) bbbb', '123123', '2020-08-23 17:34:46', 45000, 'qwerqwer'),
	(17, 'jieun', 'aaa', '48060 부산 해운대구 APEC로 17 (우동) bbb', '123123', '2020-08-23 17:36:26', 120500, 'asdfasdf'),
	(18, 'fiion', 'test4', '04047 서울 마포구 독막로3길 24-10 (서교동) aa', '12345678', '2020-08-23 18:00:49', 130400, 'qwr123'),
	(19, 'fion', 'qq', '38803 경북 영천시 신녕면 구디티길 6 ww', '123123', '2020-08-24 18:04:55', 130700, 'qwer1234!'),
	(20, 'jennie', '받는분', '13473 경기 성남시 분당구 경부고속도로 409 (삼평동) 36', '0001113334', '2020-08-24 18:09:30', 24600, '234234ㅂㅂ'),
	(21, 'rosie', 'werwer', '48060 부산 해운대구 APEC로 30 (우동) 123', '123123', '2020-08-24 18:13:33', 80440, 'wer'),
	(22, 'gaeun', 'qqq', '01062 서울 강북구 덕릉로 93 (번동) www', '123123', '2020-08-24 18:19:26', 2000, 'eee'),
	(23, 'maxime', 'qwe', '01062 서울 강북구 덕릉로 93 (번동) qq', '123213', '2020-08-24 18:21:11', 34500, 'qweqwe'),
	(24, 'rosie', '234234', '07805 서울 강서구 마곡동로 30 (마곡동) qwerw', '1234', '2020-08-24 18:24:23', 64700, 'qwewqe'),
	(25, 'rosie', '123', '01000 서울 강북구 방학로 382 (우이동) a', '123', '2020-08-25 13:44:41', 92000, '123q'),
	(26, 'jennie', 'qwer', '06362 서울 강남구 밤고개로 76-2 (수서동) aa', '123213', '2020-08-25 13:46:04', 20000, 'sdfwer'),
	(27, 'jennie', '34', '61954 광주 서구 2순환로 2275 (치평동) qq', '22', '2020-08-25 14:01:48', 40500, '33'),
	(28, 'admin', '편창현', '06281 서울 강남구 남부순환로 2907 (대치동) 지구대', '12345678', '2020-08-25 15:05:41', 45440, ''),
	(29, 'rosie', '박채영', '07650 서울 마포구 합정동 당산빌라A동 201', '01054708879', '2020-08-25 15:05:41', 50000, ''),
	(30, 'rosie', '박채영', '07650 서울 마포구 합정동 당산빌라A동 201', '01054708879', '2020-08-27 15:05:41', 130700, ''),
	(31, 'test4', 'qwer', '07644 서울 강서구 발산로 40 (외발산동) qwer', '234', '2020-08-27 10:24:45', 10000, 'weqr'),
	(32, 'abcdef', '홍길동', '12427 경기 가평군 가평읍 가랫골길 5 우리집앞', '01033334444', '2020-08-27 12:17:22', 5600, 'ㅁㅁㅁㅁㅇㅇㅇ'),
	(33, 'jennie', '창현', '06000 서울 강남구 강남대로 708 (압구정동) 123', '123', '2020-08-27 15:24:44', 35700, '123'),
	(34, 'admin', '창현', '123', '123', '2020-08-27 15:34:39', 35700, 'asdf'),
	(35, 'aa', '창현', '07803 서울 강서구 강서로 375 (마곡동) 123', '123', '2020-08-27 15:59:33', 67000, '1234');
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;

-- 테이블 stylepick.buy_detail 구조 내보내기
CREATE TABLE IF NOT EXISTS `buy_detail` (
  `order_no` int(100) NOT NULL COMMENT '주문번호',
  `seq` int(11) NOT NULL COMMENT '구분',
  `item_no` int(11) NOT NULL COMMENT '상품번호',
  `quantity` int(11) NOT NULL COMMENT '내가 살려는 갯수',
  `item_option` varchar(50) NOT NULL DEFAULT '' COMMENT '옵션번호',
  `size` varchar(50) NOT NULL DEFAULT '',
  `stat` int(11) NOT NULL COMMENT '출고여부 0=배송전 1=배송중 2=배송완료',
  `reviewed` int(2) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_no`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.buy_detail:~38 rows (대략적) 내보내기
DELETE FROM `buy_detail`;
/*!40000 ALTER TABLE `buy_detail` DISABLE KEYS */;
INSERT INTO `buy_detail` (`order_no`, `seq`, `item_no`, `quantity`, `item_option`, `size`, `stat`, `reviewed`, `amount`) VALUES
	(1, 1, 1, 2, '1', '0', 2, 1, NULL),
	(1, 2, 2, 1, '2', '0', 2, 0, NULL),
	(2, 1, 2, 2, '1', '0', 2, 0, NULL),
	(3, 1, 2, 2, '1', '0', 1, 0, NULL),
	(4, 1, 2, 2, '1', '0', 1, 0, NULL),
	(5, 1, 2, 2, '1', '0', 1, 0, NULL),
	(6, 1, 2, 2, '1', '0', 0, 0, NULL),
	(7, 1, 2, 2, '1', '0', 0, 0, NULL),
	(8, 1, 2, 2, '1', '0', 0, 0, NULL),
	(9, 1, 2, 2, '1', '0', 1, 0, NULL),
	(10, 1, 2, 2, '1', '0', 1, 0, NULL),
	(11, 1, 4, 2, '1', '0', 0, 0, NULL),
	(15, 1, 1, 2, '1', '1', 0, 0, NULL),
	(17, 1, 5, 3, '3', '1', 0, 0, NULL),
	(18, 1, 5, 3, 'test4', 'test', 0, 0, NULL),
	(19, 1, 5, 4, 'test2', 'test', 0, 0, NULL),
	(20, 1, 3, 4, 'test', 'test', 0, 0, NULL),
	(21, 1, 5, 3, 'test4', 'test', 0, 0, NULL),
	(21, 2, 1, 8, 'test', 'test', 0, 0, NULL),
	(22, 1, 5, 3, 'test2', 'test', 0, 0, NULL),
	(23, 1, 5, 2, 'test3', 'test', 0, 0, NULL),
	(23, 2, 3, 3, 'test', 'test', 0, 0, NULL),
	(24, 1, 5, 3, 'test2', 'test', 0, 0, NULL),
	(24, 2, 2, 3, 'test', 'test', 0, 0, NULL),
	(25, 1, 1, 3, 'test', 'test', 0, 0, NULL),
	(26, 1, 4, 1, 'test', '사이즈', 0, 0, NULL),
	(27, 1, 3, 1, '옵션', '사이즈', 0, 1, NULL),
	(27, 2, 5, 1, 'test3', '사이즈', 0, 0, NULL),
	(28, 1, 2, 1, 'test', 'test', 0, 1, NULL),
	(28, 2, 4, 1, 'test', 'test', 0, 0, NULL),
	(30, 1, 3, 1, '옵션', '사이즈', 0, 0, 10000),
	(30, 2, 1, 1, '옵션', '사이즈', 0, 0, 10000),
	(31, 1, 2, 1, '옵션', '사이즈', 0, 0, 10000),
	(32, 1, 5, 4, '로즈골드', '31mm', 0, 0, NULL),
	(33, 1, 2, 1, '트임', 'onesize', 1, 0, NULL),
	(34, 1, 2, 1, '옵션', '사이즈', 0, 1, NULL),
	(35, 1, 8, 1, '옵션', '사이즈', 2, 0, NULL),
	(35, 2, 1, 1, '옵션', '사이즈', 0, 0, NULL);
/*!40000 ALTER TABLE `buy_detail` ENABLE KEYS */;

-- 테이블 stylepick.comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `comment` (
  `sns_no` int(11) NOT NULL COMMENT 'sns번호',
  `reply_no` int(11) NOT NULL COMMENT '댓글번호',
  `userid` varchar(30) NOT NULL COMMENT '작성자',
  `content` varchar(300) NOT NULL COMMENT '내용',
  `regdate` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`sns_no`,`reply_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.comment:~16 rows (대략적) 내보내기
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`sns_no`, `reply_no`, `userid`, `content`, `regdate`) VALUES
	(3, 1, 'test3', 'gd', '2020-08-27 14:33:49'),
	(3, 2, 'test3', 'gd', '2020-08-27 14:33:51'),
	(3, 3, 'test3', 'gd', '2020-08-27 14:33:52'),
	(3, 4, 'test3', 'gd', '2020-08-27 14:33:54'),
	(3, 5, 'test3', 'gd', '2020-08-27 14:33:55'),
	(3, 6, 'test3', 'gd', '2020-08-27 14:33:56'),
	(3, 7, 'test3', 'gd', '2020-08-27 14:33:57'),
	(3, 8, 'test3', 'gd', '2020-08-27 14:33:58'),
	(3, 9, 'test3', 'gd', '2020-08-27 14:34:00'),
	(3, 10, 'test3', 'gd', '2020-08-27 14:34:03'),
	(4, 1, 'test4', 'test', '2020-08-18 14:05:27'),
	(4, 2, 'test4', 'test', '2020-08-18 14:06:27'),
	(4, 3, 'test4', 'test', '2020-08-18 14:08:08'),
	(4, 4, 'test4', 'test', '2020-08-18 14:09:37'),
	(4, 5, 'test4', 'test4', '2020-08-18 14:25:26'),
	(14, 1, 'aa', 'd', '2020-08-26 14:44:04');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- 테이블 stylepick.follow 구조 내보내기
CREATE TABLE IF NOT EXISTS `follow` (
  `userid` varchar(20) NOT NULL,
  `following` varchar(30) NOT NULL,
  PRIMARY KEY (`userid`,`following`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.follow:~1 rows (대략적) 내보내기
DELETE FROM `follow`;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` (`userid`, `following`) VALUES
	('jennie', 'admin'),
	('test4', 'admin');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;

-- 테이블 stylepick.item 구조 내보내기
CREATE TABLE IF NOT EXISTS `item` (
  `item_no` int(11) NOT NULL COMMENT '상품번호',
  `userid` varchar(30) NOT NULL COMMENT '판매자아이디',
  `code` varchar(20) NOT NULL COMMENT '상품코드',
  `category` int(11) NOT NULL COMMENT '카테고리\r\n1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9',
  `subject` varchar(50) NOT NULL COMMENT '제목',
  `item_name` varchar(50) NOT NULL COMMENT '상품명',
  `price` int(100) NOT NULL COMMENT '상품가격',
  `keyword` varchar(50) DEFAULT NULL COMMENT '키워드 #',
  `pictureUrl` varchar(200) DEFAULT NULL COMMENT '상품사진',
  `content` varchar(500) DEFAULT NULL COMMENT '상품내용',
  `regdate` datetime DEFAULT NULL COMMENT '등록일..필요할까요?',
  `readcnt` int(11) DEFAULT NULL,
  `item_option` varchar(100) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.item:~10 rows (대략적) 내보내기
DELETE FROM `item`;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`item_no`, `userid`, `code`, `category`, `subject`, `item_name`, `price`, `keyword`, `pictureUrl`, `content`, `regdate`, `readcnt`, `item_option`, `size`) VALUES
	(1, 'jennie', '50071', 4, '블핑룩 스트라이크 크롭탑 프리사이즈', '스트라이프 크롭탑', 17000, '#블랙핑크 #슬림룩 #바캉스', NULL, 'test12', '2020-08-21 16:00:36', 197, ',,,,blue, pink', ',,,,free'),
	(2, 'jennie', '50072', 2, 'Summer 로브 기획전', '에스닉 스타일 로브', 35700, '#여름 #로브', 'pic07.png', 'test', '2020-08-21 17:21:15', 169, '트임, 트임없음', 'onesize'),
	(3, 'fion', '700050', 4, '망고 골지 나시 민소매 모음전', '망고나시 골지티', 7000, '#망고나시 #골지티 #저려한탑', 'pic00.png', 'test', '2020-08-24 10:05:05', 75, '블랙망고나시,화이트망고나시,그레이골지티,핑크골지티', 'onesize'),
	(4, 'rosie', '600', 7, '런던 부츠', '페이크 가죽 런던 부츠', 65700, '#직수입 #런던부츠 #신발', 'S_4.jpg', 'test', '2020-08-24 10:05:39', 72, '블랙,브라운', '230,235,240,245,250'),
	(5, 'rosie', '601', 8, '롤렉스 데이저스트 로즈콤비', '롤렉스 데이저스트 로즈콤비', 14000000, '#명품시계 #여성시계 #롤렉스', 'Tulips.jpg', '<p><img src="https://cdn2.jomashop.com/media/catalog/product/r/o/rolex-datejust-31-rose-dial-automatic-ladies-steel-and-18kt-everose-gold-jubilee-watch-278241psj.jpg"></p>', '2020-08-25 18:06:57', 33, '로즈골드', '31mm'),
	(6, 'jennie', 'ㅣㄴㅁ어;ㅣㅁ', 1, '제목1', '신발', 111, 'das', 'cap.jpg', '<p>dasdas</p>\r\n', '2020-08-27 11:54:38', 17, '비쌈', '100'),
	(7, 'jennie', 'asf', 3, 'asdf', 'af', 12300, '123', NULL, '<p>df</p>\r\n', '2020-08-27 15:27:42', 7, ',df', ',123'),
	(8, 'aa', '11142', 2, '아우터', '아우터', 50000, '', NULL, '<p>114</p>\r\n', '2020-08-27 15:51:52', 18, '', ''),
	(9, 'admin', 'ddd', 1, '제목1', 'dddd', 111111, '아', 'cap.jpg', '<p>dasdsadas</p>\r\n', '2020-08-27 17:28:01', 2, '파란색', '60'),
	(10, 'admin', 'ㄴㅁ아ㅣ이', 4, 'gfjfjjfjfjf', '롤렉스', 1000, '#아우터, #센트', '모자.jpg', '<p>dsadsa</p>\r\n', '2020-08-27 17:30:03', 6, '파란색', '');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

-- 테이블 stylepick.item_qna 구조 내보내기
CREATE TABLE IF NOT EXISTS `item_qna` (
  `qna_no` int(11) NOT NULL,
  `item_no` int(11) NOT NULL COMMENT '상품번호',
  `type` int(11) NOT NULL COMMENT '문의종류',
  `userid` varchar(50) DEFAULT NULL COMMENT '회원아이디',
  `content` varchar(500) DEFAULT NULL COMMENT '문의내용',
  `regdate` datetime DEFAULT NULL COMMENT '등록시간',
  `grp` int(10) DEFAULT NULL,
  `grplevel` int(10) DEFAULT NULL,
  `grpstep` int(10) DEFAULT NULL,
  PRIMARY KEY (`qna_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.item_qna:~6 rows (대략적) 내보내기
DELETE FROM `item_qna`;
/*!40000 ALTER TABLE `item_qna` DISABLE KEYS */;
INSERT INTO `item_qna` (`qna_no`, `item_no`, `type`, `userid`, `content`, `regdate`, `grp`, `grplevel`, `grpstep`) VALUES
	(1, 1, 0, '', '1', '2020-08-26 17:49:37', 1, 0, 0),
	(2, 1, 0, '', '2', '2020-08-26 17:49:39', 2, 0, 0),
	(3, 1, 0, '', '3', '2020-08-26 17:49:41', 3, 0, 0),
	(4, 1, 1, '', '1', '2020-08-26 17:49:45', 2, 1, 1),
	(5, 1, 1, '', 'ㅇㅇㅇ', '2020-08-26 17:53:07', 3, 1, 1),
	(6, 1, 0, '', 'ddd', '2020-08-27 13:34:11', 6, 0, 0);
/*!40000 ALTER TABLE `item_qna` ENABLE KEYS */;

-- 테이블 stylepick.line 구조 내보내기
CREATE TABLE IF NOT EXISTS `line` (
  `line_no` int(11) NOT NULL,
  `item_no` int(11) NOT NULL COMMENT '상품번호',
  `userid` varchar(30) NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `evaluation` int(10) NOT NULL,
  `regdate` datetime DEFAULT NULL,
  `order_no` int(100) DEFAULT NULL,
  `seq` int(100) DEFAULT NULL,
  PRIMARY KEY (`line_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.line:~9 rows (대략적) 내보내기
DELETE FROM `line`;
/*!40000 ALTER TABLE `line` DISABLE KEYS */;
INSERT INTO `line` (`line_no`, `item_no`, `userid`, `content`, `evaluation`, `regdate`, `order_no`, `seq`) VALUES
	(1, 1, 'admin', '옷이 찢어져있어요.', 5, '2020-08-01 11:16:40', 1, 1),
	(3, 1, 'gaeun', '별로에요', 1, '2020-08-07 11:25:53', 3, 1),
	(4, 1, 'rosie', '가성비 짱', 4, '2020-08-14 12:16:40', 4, 1),
	(5, 1, 'maxime', '저렴한 가격에 퀄리티가 좋아요', 3, '2020-08-21 13:02:19', 5, 1),
	(6, 1, 'stefan', '너무 너무 예쁘고 사길 잘한 것 같아요 정말 감합니다 잘 쓰겠습니다.', 4, '2020-08-22 14:02:47', 6, 1),
	(9, 2, 'admin', '1234', 4, '2020-08-27 16:37:58', 0, 0),
	(11, 3, 'jennie', 'ㅇㅇ', 5, '2020-08-27 16:49:23', 27, 1),
	(12, 2, 'jennie', 'ㅂㄷㅈㄱ', 5, '2020-08-27 16:50:25', 33, 1),
	(13, 2, 'admin', 'dddd', 5, '2020-08-27 18:07:22', 28, 1);
/*!40000 ALTER TABLE `line` ENABLE KEYS */;

-- 테이블 stylepick.reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `reply` (
  `rno` int(11) DEFAULT NULL,
  `bno` int(11) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.reply:~0 rows (대략적) 내보내기
DELETE FROM `reply`;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;

-- 테이블 stylepick.sns 구조 내보내기
CREATE TABLE IF NOT EXISTS `sns` (
  `sns_no` int(11) NOT NULL COMMENT 'sns번호',
  `type` int(10) NOT NULL COMMENT 'ootd, 리뷰, QnA',
  `userid` varchar(50) NOT NULL DEFAULT '' COMMENT '회원아이디',
  `img1` varchar(200) DEFAULT NULL COMMENT '이미지',
  `description` varchar(300) DEFAULT NULL COMMENT '설명',
  `regdate` datetime DEFAULT NULL COMMENT '등록일',
  `height` int(5) DEFAULT NULL,
  `weight` int(5) DEFAULT NULL,
  PRIMARY KEY (`sns_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.sns:~16 rows (대략적) 내보내기
DELETE FROM `sns`;
/*!40000 ALTER TABLE `sns` DISABLE KEYS */;
INSERT INTO `sns` (`sns_no`, `type`, `userid`, `img1`, `description`, `regdate`, `height`, `weight`) VALUES
	(1, 1, 'admin', 'pic02.png', '설명', '2020-08-14 10:15:29', 180, 80),
	(2, 1, 'admin', 'pic02.png', '설명', '2020-08-14 10:17:37', 180, 80),
	(3, 1, 'test4', 'test12.PNG', 'test4', '2020-08-14 13:54:53', 50, 160),
	(4, 1, 'test4', 'test2.PNG', 'teset4', '2020-08-14 13:57:28', 50, 160),
	(5, 1, 'test4', 'test3.PNG', 'test4', '2020-08-14 14:05:08', 50, 160),
	(7, 1, 'admin', 'jenn.jpg', 'black pink in you area', '2020-08-24 16:38:05', 161, 42),
	(8, 1, 'admin', 'test11.PNG', 'style pick sns feed2', '2020-08-24 16:57:48', 161, 42),
	(9, 1, 'admin', 'test9.PNG', 'style pick sns feed3', '2020-08-24 17:43:59', 0, 0),
	(10, 1, 'admin', 'test9.PNG', 'test', '2020-08-24 17:45:23', 0, 0),
	(11, 1, 'jennie', 'test10.PNG', 'test', '2020-08-25 14:38:14', 0, 0),
	(12, 1, 'jennie', 'test9.PNG', 'test', '2020-08-25 14:38:25', 0, 0),
	(13, 1, 'jennie', 'test11.PNG', 'test', '2020-08-25 14:38:34', 0, 0),
	(14, 1, 'aa', 'S_3.jpg', '', '2020-08-26 13:58:16', 150, 60),
	(16, 2, 'test1', NULL, 'aaa', '2020-08-27 15:46:08', 0, 0),
	(17, 2, 'test1', NULL, 'asdf', '2020-08-27 15:46:24', 0, 0),
	(18, 1, 'admin', 'test1.PNG', 'test', '2020-08-27 17:29:39', 0, 0);
/*!40000 ALTER TABLE `sns` ENABLE KEYS */;

-- 테이블 stylepick.snsitem 구조 내보내기
CREATE TABLE IF NOT EXISTS `snsitem` (
  `sns_no` int(11) NOT NULL COMMENT 'sns번호',
  `seq` int(11) NOT NULL COMMENT 'item단과 ootd 단 구별?',
  `category` varchar(50) DEFAULT NULL,
  `isshopitem` int(2) DEFAULT NULL,
  `detail` varchar(100) DEFAULT NULL COMMENT '상품코드 또는 브랜드명',
  PRIMARY KEY (`sns_no`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.snsitem:~13 rows (대략적) 내보내기
DELETE FROM `snsitem`;
/*!40000 ALTER TABLE `snsitem` DISABLE KEYS */;
INSERT INTO `snsitem` (`sns_no`, `seq`, `category`, `isshopitem`, `detail`) VALUES
	(8, 1, 'hat', 1, 'test1'),
	(8, 2, 'bottom', 5, 'test22'),
	(8, 3, 'shoes', 0, 'test3'),
	(9, 1, 'hat', 1, 'test1'),
	(9, 2, 'bottom', 5, 'test22'),
	(9, 3, 'shoes', 0, 'test3'),
	(10, 1, 'hat', 1, 'test1'),
	(10, 2, 'outer', 0, 'test2'),
	(11, 1, 'hat', 1, 'test1'),
	(12, 1, 'hat', 1, 'test1'),
	(13, 1, 'hat', 1, 'test1'),
	(14, 1, 'watch', 0, '오버워치'),
	(18, 1, 'hat', 0, 'test');
/*!40000 ALTER TABLE `snsitem` ENABLE KEYS */;

-- 테이블 stylepick.sns_like 구조 내보내기
CREATE TABLE IF NOT EXISTS `sns_like` (
  `sns_no` int(11) NOT NULL COMMENT 'sns번호',
  `userid` varchar(30) NOT NULL COMMENT '회원아이디',
  `regdate` datetime NOT NULL COMMENT '좋아요날짜',
  PRIMARY KEY (`sns_no`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.sns_like:~15 rows (대략적) 내보내기
DELETE FROM `sns_like`;
/*!40000 ALTER TABLE `sns_like` DISABLE KEYS */;
INSERT INTO `sns_like` (`sns_no`, `userid`, `regdate`) VALUES
	(1, 'test3', '2020-08-27 14:25:37'),
	(1, 'test4', '2020-08-27 14:25:07'),
	(2, 'jennie', '2020-08-27 15:26:48'),
	(2, 'test1', '2020-08-27 15:39:50'),
	(2, 'test4', '2020-08-27 17:52:48'),
	(3, 'test4', '2020-08-27 14:25:12'),
	(4, 'test3', '2020-08-27 14:25:35'),
	(4, 'test4', '2020-08-27 14:25:14'),
	(6, 'test3', '2020-08-27 14:25:39'),
	(6, 'test4', '2020-08-27 17:54:00'),
	(7, 'admin', '2020-08-27 14:19:26'),
	(9, 'test3', '2020-08-27 14:25:43'),
	(10, 'test4', '2020-08-27 14:25:17'),
	(13, 'test4', '2020-08-27 14:25:21'),
	(15, 'test1', '2020-08-27 15:42:27');
/*!40000 ALTER TABLE `sns_like` ENABLE KEYS */;

-- 테이블 stylepick.todolist 구조 내보내기
CREATE TABLE IF NOT EXISTS `todolist` (
  `No` int(11) NOT NULL,
  `duedate` datetime DEFAULT NULL,
  `content` varchar(30) DEFAULT NULL,
  `fin` enum('y','n') NOT NULL,
  PRIMARY KEY (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.todolist:~0 rows (대략적) 내보내기
DELETE FROM `todolist`;
/*!40000 ALTER TABLE `todolist` DISABLE KEYS */;
/*!40000 ALTER TABLE `todolist` ENABLE KEYS */;

-- 테이블 stylepick.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `no` int(100) NOT NULL,
  `userid` varchar(20) NOT NULL COMMENT '회원아이디',
  `password` varchar(30) NOT NULL COMMENT '회원비밀번호',
  `nickname` varchar(30) NOT NULL COMMENT '닉네임',
  `email` varchar(50) NOT NULL COMMENT '회원이메일',
  `tel` varchar(30) DEFAULT NULL COMMENT '회원전화번호',
  `age` int(20) DEFAULT NULL COMMENT '나이',
  `imgurl` varchar(200) DEFAULT NULL COMMENT '회원사진',
  `gender` int(5) DEFAULT NULL COMMENT '0남, 1여',
  `comment` varchar(100) DEFAULT NULL,
  `sns_type` int(10) DEFAULT NULL COMMENT '소셜구분',
  `sns_id` varchar(20) DEFAULT NULL COMMENT '소셜아이디',
  `seller` int(2) NOT NULL COMMENT '판매불가 0, 판매가능 1',
  `name` varchar(20) DEFAULT NULL COMMENT '회원이름(실명)',
  `com_name` varchar(30) DEFAULT NULL COMMENT '회사이름',
  `com_regist` varchar(50) DEFAULT NULL COMMENT '회사등록번호',
  `com_img` varchar(200) DEFAULT NULL COMMENT '회사프로필사진',
  `com_tel` varchar(30) DEFAULT NULL COMMENT '회사번호',
  `regdate` datetime DEFAULT NULL COMMENT '가입날짜',
  `address` varchar(100) DEFAULT NULL,
  `order_memo` varchar(100) DEFAULT NULL,
  `order_tel` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 stylepick.user:~13 rows (대략적) 내보내기
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`no`, `userid`, `password`, `nickname`, `email`, `tel`, `age`, `imgurl`, `gender`, `comment`, `sns_type`, `sns_id`, `seller`, `name`, `com_name`, `com_regist`, `com_img`, `com_tel`, `regdate`, `address`, `order_memo`, `order_tel`) VALUES
	(1, 'admin', '1234', '관리자', 'admin@stylepick.shop', ' 012345678', 26, 'commonXBU07A9D.jpg', 1, '관리자입니다.', NULL, NULL, 1, '김관리', 'Una Coop', '1234', NULL, '1234', '2020-08-13 18:28:21', NULL, NULL, NULL),
	(2, 'test4', 'test4', '김삿갓', 'test4@aaa.com', '021112201', 21, NULL, 1, '', NULL, NULL, 1, '김삿갓', '김삿갓샵', 'test4', 'S_4.jpg', 'test4', '2020-08-14 10:01:58', NULL, NULL, NULL),
	(3, 'test3', '1234', 'test3', 'pyeon95@naver.com', '123456879', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'test3', 'test3 comp', '111022', NULL, '12345678', '2020-08-21 14:37:31', NULL, NULL, NULL),
	(4, 'jennie', '1234', '김제니', 'jennie@google.com', '13070000000', 25, NULL, 2, '', NULL, NULL, 1, '김제니', '젠샵', '0000', NULL, '13070000000', '2019-08-13 18:28:21', NULL, NULL, NULL),
	(5, 'rosie', '1234', '박채영', 'rosie@google.com', '860000000000', 24, NULL, 2, '', NULL, NULL, 1, '박채영', '챙샵', '00001', NULL, '8600000000', '2019-05-05 18:28:21', NULL, NULL, NULL),
	(6, 'jieun', '1234', '이지은', 'jieun@google.com', '821000000000', 28, NULL, 2, '', NULL, NULL, 0, '', '', '', NULL, '', '2019-06-05 18:28:21', NULL, NULL, NULL),
	(7, 'gaeun', '1234', '이가은', 'gaeun@google.com', '82100000045454', 27, NULL, 2, '', NULL, NULL, 0, '', '', '', NULL, '', '2019-08-05 18:28:21', NULL, NULL, NULL),
	(8, 'stefan', '1234', '스테판', 'stefan@google.com', '44545454654010', 30, NULL, 1, '', NULL, NULL, 1, '스테판', '코드네임 옷가게', '1521212', NULL, '44545454545454', '2019-08-15 18:28:21', NULL, NULL, NULL),
	(9, 'maxime', '1234', '맥스', 'max@google.com', '100132145454', 34, NULL, 1, '', NULL, NULL, 1, '맥스', '맥시무스', '5857457', NULL, '10013214545454', '2019-08-16 18:28:21', NULL, NULL, NULL),
	(10, 'fion', '1234', '조진이', 'jianyi@google.com', '8640410457', 31, NULL, 2, '', NULL, NULL, 1, '조진이', '슈렉엔피온', '45450', NULL, '86404104547', '2019-08-17 18:28:21', NULL, NULL, NULL),
	(11, 'abcdef', '1234', 'hohoho', 'abc@naver.com', '13060445077', 21, NULL, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2020-08-24 15:30:30', NULL, NULL, NULL),
	(12, 'aa', 'aa', 'adsfasdf', 'aa@bb.cc', '01022004497', 19, 'S_5.jpg', 2, '', NULL, NULL, 1, 'aa', 'aa company', '', 'pic03.png', '', '2020-08-26 10:36:12', NULL, NULL, NULL),
	(13, 'test1', '1234', 'atess', 'test1@aaa.bb', '123', 0, NULL, 0, '', NULL, NULL, 1, '창현', 'aaa comp', '', NULL, '', '2020-08-27 15:39:25', NULL, NULL, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
