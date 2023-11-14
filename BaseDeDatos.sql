
CREATE TABLE CompanyInformation 
	(
    CompanyName VARCHAR(25) NOT NULL,
    CompanyAdress VARCHAR(75)  NOT NULL,
    CompanyPostalCode VARCHAR(10) NULL , 
    CompanyCountry VARCHAR(20) NULL,
    CompanyPhoneNumber VARCHAR(20) NOT NULL,
    CompanyMail VARCHAR(50) NULL,
    CompanyFoundation DATE NULL,
    CompanyDescription TEXT NULL
	)
CREATE TABLE PatientsInformation 
	(
	PatientId INT IDENTITY(1,1)  PRIMARY KEY NOT NULL,
	PatientName VARCHAR(30)  NOT NULL,
	PatientLastName  VARCHAR(30) NOT NULL,
	PatientDNI VARCHAR(30)  NOT NULL,
	PatientCountry VARCHAR(30) NULL,
	PatientCity VARCHAR(30) NULL,
	PatientPostalCode  INT NULL,
	PatientAge INT NULL,
	PatientPhoneNumber VARCHAR NULL,
	PatientBirthdate DATE NULL,
	PatientActive BIT NULL
	)
	
CREATE TABLE PatientsAcess 
	(
	PatientId INT NOT NULL,
	PatientEntryTime DATETIME NOT NULL,
	PatientDepartureTime DATETIME NOT NULL,
	PatientLogin BIT NOT NULL,
	FOREIGN KEY (PatientId) REFERENCES  PatientsInformation (PatientId)
	)
	
CREATE TABLE PatientLogin
	(
	PatientId INT NOT NULL,
	PatientUsername VARCHAR(15) NOT NULL,
	PatientPassword TEXT NOT NULL
	FOREIGN KEY (PatientId) REFERENCES  PatientsInformation (PatientId)
	)
CREATE TABLE MedicalTestsInformation
	(
	TestId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	PatientId INT NOT NULL,
	TestDate DATE NULL,
	TestTime TIME  NULL,
	SampleType varchar(30) NULL,
	TestType varchar (30) NULL,
	FOREIGN KEY (PatientId) REFERENCES  PatientsInformation (PatientId)
	)

CREATE TABLE HematocritoTest	
	(
	HematocritoTestId INT PRIMARY KEY  IDENTITY(1,1) NOT NULL,
    TestId INT  NOT NULL ,
    PatientId INT NOT NULL,
    HTC DECIMAL(5, 2)  NULL,
    HB DECIMAL(5, 2)  NULL,
    RGR INT  NULL ,
    VCM DECIMAL(5, 2) NULL,
    CHCM DECIMAL(5, 2) NULL,
    VDGR DECIMAL(5, 2) NULL,
    Observations TEXT NULL,
	FOREIGN KEY (PatientId) REFERENCES  PatientsInformation (PatientId),
	FOREIGN KEY (TestId) REFERENCES  MedicalTestsInformation (TestId)
	)
CREATE TABLE ColesterolTest
	(
    ColesterolTestId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    TestId INT  NOT NULL ,
    PatientId INT NOT NULL,
    ColesterolTotal DECIMAL(5, 2) NULL,
    ColesterolHDL DECIMAL(5, 2) NULL,
    ColesterolLDL DECIMAL(5, 2) NULL,
    Trigliceridos DECIMAL(5, 2) NULL,
    FOREIGN KEY (PatientId) REFERENCES  PatientsInformation (PatientId),
	FOREIGN KEY (TestId) REFERENCES  MedicalTestsInformation (TestId)
	)
	
CREATE TABLE PerfilHepaticoTest 
	(
    PerfilHepaticoTestId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    TestId INT  NOT NULL ,
    PatientId INT NOT NULL,
    ALT DECIMAL(5, 2) NULL,
    AST DECIMAL(5, 2) NULL,
    FosfatasaAlcalina DECIMAL(5, 2) NULL,
    BilirrubinaTotal DECIMAL(5, 2) NULL,
	ProteinaTotal DECIMAL(5, 2),
    FOREIGN KEY (PatientId) REFERENCES  PatientsInformation (PatientId),
	FOREIGN KEY (TestId) REFERENCES  MedicalTestsInformation (TestId)
	)fn
	
CREATE TABLE FuncionTiroideaTest
	(
    FuncionTiroideaTestId INT PRIMARY KEY  IDENTITY(1,1) NOT NULL,
    TestId INT  NOT NULL ,
    PatientId INT NOT NULL,
    TSH DECIMAL(5, 2) NULL,
    T3 DECIMAL(5, 2) NULL,
    T4 DECIMAL(5, 2) NULL,
	AnticuerposTiroideos DECIMAL(5, 2) NULL,
    Calcitonina DECIMAL(5, 2) NULL,
	FOREIGN KEY (PatientId) REFERENCES  PatientsInformation (PatientId),
	FOREIGN KEY (TestId) REFERENCES  MedicalTestsInformation (TestId)
	)
	
CREATE TABLE ElectrocardiogramaTest 
	(
    ElectrocardiogramaTestId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    TestId INT  NOT NULL ,
    PatientId INT NOT NULL,
    RitmoCardiaco VARCHAR(50)NULL,
    OndasP DECIMAL(5, 2) NULL,
    OndasQRS DECIMAL(5, 2) NULL,
    IntervaloPR DECIMAL(5, 2) NULL,
    SegmentoST DECIMAL(5, 2) NULL,
    FOREIGN KEY (PatientId) REFERENCES  PatientsInformation (PatientId),
	FOREIGN KEY (TestId) REFERENCES  MedicalTestsInformation (TestId)
	)
	
CREATE TABLE CoagulacionSanguineaTest 
	(
    CoagulacionSanguineaTestId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    TestId INT  NOT NULL ,
    PatientId INT NOT NULL,
    TiempoProtrombina DECIMAL(5, 2) NULL,
    TiempoTromboplastinaParcial DECIMAL(5, 2) NULL,
    FactorVIII DECIMAL(5, 2) NULL,
    DímeroD DECIMAL(5, 2) NULL,
    Fibrinógeno DECIMAL(5, 2) NULL,
    FOREIGN KEY (PatientId) REFERENCES  PatientsInformation (PatientId),
	FOREIGN KEY (TestId) REFERENCES  MedicalTestsInformation (TestId)
	)
	
CREATE TABLE FuncionRenalAvanzadoTest 
	(
    FuncionRenalAvanzadoTestId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    TestId INT  NOT NULL ,
    PatientId INT NOT NULL,
    Creatinina DECIMAL(5, 2) NULL,
    Urea DECIMAL(5, 2) NULL,
    ÁcidoÚrico DECIMAL(5, 2) NULL,
    FiltradoGlomerular DECIMAL(5, 2) NULL,
    Microalbuminuria DECIMAL(5, 2) NULL,
    FOREIGN KEY (PatientId) REFERENCES  PatientsInformation (PatientId),
	FOREIGN KEY (TestId) REFERENCES  MedicalTestsInformation (TestId)
	)
	
CREATE TABLE GasesSanguineosTest 
	(
    GasesSanguineosTestId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    TestId INT  NOT NULL ,
    PatientId INT NOT NULL,
    pHArterial DECIMAL(5, 2)  NULL,
    PCO2 DECIMAL(5, 2)NULL,
    PO2 DECIMAL(5, 2) NULL,
    Bicarbonato DECIMAL(5, 2) NULL,
    SaturacionOxigeno DECIMAL(5, 2) NULL,
	FOREIGN KEY (PatientId) REFERENCES  PatientsInformation (PatientId),
	FOREIGN KEY (TestId) REFERENCES  MedicalTestsInformation (TestId)
    )
CREATE TABLE VitaminasTest 
	(
    VitaminasTestId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    TestId INT  NOT NULL ,
    PatientId INT NOT NULL,
    VitaminaA DECIMAL(5, 2) NULL,
    VitaminaB12 DECIMAL(5, 2)  NULL,
    VitaminaD DECIMAL(5, 2) NULL,
    VitaminaE DECIMAL(5, 2) NULL,
    VitaminaK DECIMAL(5, 2) NULL,
	FOREIGN KEY (PatientId) REFERENCES  PatientsInformation (PatientId),
	FOREIGN KEY (TestId) REFERENCES  MedicalTestsInformation (TestId)
	)
CREATE TABLE RadiografiaToraxTest 
	(
    RadiografiaToraxTestId INT PRIMARY KEY IDENTITY(1,1)NOT NULL,
    TestId INT  NOT  NULL ,
    PatientId INT NOT  NULL,
    Hallazgos TEXT  NULL,
    TamañoCorazon DECIMAL(5, 2) NULL,
    PatronesPulmonares TEXT  NULL ,
    CostoDiafragma DECIMAL(5, 2) NULL,
	FOREIGN KEY (PatientId) REFERENCES  PatientsInformation (PatientId),
	FOREIGN KEY (TestId) REFERENCES  MedicalTestsInformation (TestId) 
	)
