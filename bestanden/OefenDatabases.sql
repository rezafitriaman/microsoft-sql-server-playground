if not exists(select * from sys.databases where name = 'Foundation')
	create database Foundation
go

use Foundation
go

drop table if exists Boekdeel
drop table if exists Exemplaar
drop table if exists Boek
drop table if exists Lener
drop table if exists Vervanger
drop table if exists Werknemer
drop table if exists Vestiging
go

create table Vestiging (
     Vesnaam    varchar(16) not null
    ,Branche    varchar(16) not null
    ,Plaats     varchar(16) not null
    ,primary key (Vesnaam)
)
--
insert into Vestiging (Vesnaam,Branche,Plaats) values
     ('SNELHAP'     ,'HORECA'   ,'ARNHEM')
    ,('ZEELUST'     ,'HOTEL'    ,'ZANDVOORT')
    ,('HOK-O-TEL'   ,'HOTEL'    ,'AMSTERDAM')
    ,('OKOTEL'      ,'HOTEL'    ,'AMSTERDAM')
    ,('RHODOS'      ,'HORECA'   ,'ABCOUDE')
    ,('FONG'        ,'HORECA'   ,'ARNHEM')
--
create table Werknemer (
     W#         integer     not null
    ,Wnaam      varchar(16) not null
    ,Afdeling   varchar(16) not null
    ,Fnaam      varchar(16) not null
    ,Salaris    integer     not null
    ,Vesnaam    varchar(16) not null
    ,primary key (W#)
)
--
insert into Werknemer ( W#, Wnaam, Afdeling, Fnaam, Salaris,Vesnaam) values
     (1     ,'AARTS'    ,'DIRECTIE'     ,'DIRECTEUR'    ,8000   ,'HOK-O-TEL')
    ,(2     ,'BROUWER'  ,'BALIE'        ,'CONFERENCIER' ,18000  ,'ZEELUST')
    ,(3     ,'BUIS'     ,'ROOMSERVICE'  ,'KLERK'        ,1400   ,'ZEELUST')
    ,(4     ,'CHIN'     ,'BALIE'        ,'KLERK'        ,800    ,'OKOTEL')
    ,(5     ,'DEKKER'   ,'DIRECTIE'     ,'DIRECTEUR'    ,8000   ,'OKOTEL')
    ,(6     ,'EVERS'    ,'PATAT'        ,'DIRECTEUR'    ,12000  ,'SNELHAP')
    ,(7     ,'EVERS'    ,'DIRECTIE'     ,'CONFERENCIER' ,9000   ,'HOK-O-TEL')
    ,(8     ,'HEVEL'    ,'DIRECTIE'     ,'DIRECTEUR'    ,9000   ,'FONG')
    ,(9     ,'JANSEN'   ,'ROOMSERVICE'  ,'KLERK'        ,1600   ,'HOK-O-TEL')
    ,(10    ,'KAPER'    ,'KEUKEN'       ,'KOK'          ,673    ,'RHODOS')
    ,(11    ,'LI'       ,'KEUKEN'       ,'KOK'          ,4500   ,'FONG')
    ,(12    ,'LI'       ,'KEUKEN'       ,'KOK'          ,800    ,'FONG')
    ,(13    ,'MOL'      ,'BALIE'        ,'CONFERENCIER' ,6000   ,'HOK-O-TEL')
    ,(14    ,'PIETERS'  ,'RESTAURANT'   ,'OBER'         ,3200   ,'RHODOS')
    ,(15    ,'VOS'      ,'DIRECTIE'     ,'DIRECTEUR'    ,8000   ,'ZEELUST')
--
create table Vervanger (
     Vervangene integer not null
    ,Vervanger  integer not null
    ,primary key (Vervangene, Vervanger)
)
--
insert into Vervanger (Vervangene, Vervanger) values
     (1     ,5)
    ,(2     ,13)
    ,(3     ,2)
    ,(4     ,5)
    ,(4     ,9)
    ,(4     ,14)
    ,(5     ,7)
    ,(6     ,11)
    ,(6     ,12)
    ,(9     ,13)
    ,(9     ,4)
    ,(10    ,11)
    ,(10    ,14)
    ,(11    ,12)
    ,(12    ,11)
--
create table Lener (
     Lnaam      varchar(16) not null
    ,Gebdat     date        not null
    ,Adres      varchar(32) not null
    ,Wplaats    varchar(16) not null
    ,primary key (Lnaam)
)
--
insert into Lener (Lnaam, Gebdat, Adres, Wplaats) values
     ('BEETS'   ,'1946-06-19'   ,'KERKSTRAAT 2' ,'LOENEN')
    ,('BLOM'    ,'1964-09-23'   ,'SINGEL 17'    ,'VREELAND')
    ,('EPPINK'  ,'1958-01-14'   ,'ZEELAAN 18'   ,'VREELAND')
    ,('FORTUIN' ,'1974-04-16'   ,'TOLWEG 58'    ,'ABCOUDE')
    ,('HORN'    ,'1936-03-21'   ,'HOFSTEE 34'   ,'LOENEN')
    ,('MULDER'  ,'1971-07-12'   ,'BLOMHOF 10'   ,'LOENEN')
    ,('SMID'    ,'1968-08-13'   ,'EEMLAAN 79'   ,'LOENEN')
    ,('VONK'    ,'1975-09-17'   ,'LANDLUST 9'   ,'VREELAND')
--
create table Boek (
     B#         integer     not null
    ,Bnaam      varchar(16) not null
    ,Categorie  varchar(16) not null
    ,primary key (B#)
)
--
insert into Boek (B#, Bnaam, Categorie) values
     (1    ,'AAN ZEE'           ,'ROMAN')
    ,(2    ,'OP DE PLAS'        ,'SPORT')
    ,(3    ,'DOKTER X'          ,'ROMAN')
    ,(4    ,'VISSEN'            ,'SPORT')
    ,(5    ,'VLIEGTUIGBOUW'     ,'TECHNIEK')
    ,(6    ,'ZOMERZOTHEID'      ,'ROMAN')
    ,(7    ,'OP AVONTUUR'       ,'ROMAN')
    ,(8    ,'ZEILEN'            ,'SPORT')
    ,(9    ,'ZUSTER ANNA'       ,'ROMAN')
    ,(10   ,'ZELF SLEUTELEN'    ,'TECHNIEK')
    ,(11   ,'ELEKTRONICA'       ,'TECHNIEK')
--
create table Exemplaar (
     B#     integer     not null
    ,Volg#  varchar(16) not null
    ,Adatum date        not null
    ,Udatum date        null
    ,Lnaam  varchar(16) null
    ,primary key (B#, Volg#)
)
--
insert into Exemplaar (B#, Volg#, Adatum, Udatum, Lnaam) values
     (1    ,1   ,'1997-01-12'   ,null           ,null)
    ,(1    ,2   ,'1997-01-12'   ,'1997-04-29'  ,'VONK')
    ,(2    ,1   ,'1997-01-20'   ,'1997-04-28'  ,'BLOM')
    ,(3    ,1   ,'1997-01-20'   ,null           ,null)
    ,(4    ,1   ,'1997-01-20'   ,'1997-04-28'  ,'BLOM')
    ,(4    ,2   ,'1997-02-23'   ,null           ,null)
    ,(4    ,3   ,'1997-02-23'   ,null           ,null)
    ,(5    ,1   ,'1997-01-20'   ,'1997-04-28'  ,'FORTUIN')
    ,(6    ,1   ,'1997-01-20'   ,null           ,null)
    ,(6    ,2   ,'1997-02-23'   ,null           ,null)
    ,(6    ,3   ,'1997-02-23'   ,'1997-05-15'  ,'EPPINK')
    ,(7    ,1   ,'1997-01-20'   ,null           ,null)
    ,(7    ,2   ,'1997-04-14'   ,null           ,null)
    ,(8    ,1   ,'1997-01-20'   ,null           ,null)
    ,(9    ,1   ,'1997-01-23'   ,'1997-05-18'  ,'HORN')
    ,(10   ,1   ,'1997-01-20'   ,'1997-05-20'  ,'BLOM')
    ,(10   ,2   ,'1997-04-15'   ,'1997-04-28'  ,'FORTUIN')
    ,(10   ,3   ,'1997-04-07'   ,'1997-05-19'  ,'BEETS')
    ,(11   ,1   ,'1997-05-04'   ,'1997-05-22'  ,'FORTUIN')
    ,(11   ,2   ,'1997-05-04'   ,null           ,null)
    ,(11   ,3   ,'1997-05-04'   ,'1997-05-22'  ,'BEETS')
--
create table Boekdeel (
     Bd#    integer     not null
    ,Deel#  integer     not null
    ,Dnaam  varchar(16) not null
    ,Inbd#  integer     null
    ,Inb#   integer     null
    ,primary key (bd#)
)
--
insert into Boekdeel (Bd#, Deel#, Dnaam, Inbd#, Inb#) values
     (1    ,1   ,'DE RONDE'     ,null   ,3)
    ,(2    ,2   ,'SLOT'         ,null   ,3)
    ,(3    ,1   ,'INLEIDING'    ,null   ,5)
    ,(4    ,2   ,'TEKENEN'      ,null   ,5)
    ,(5    ,3   ,'BOUWEN'       ,null   ,5)
    ,(6    ,4   ,'VLIEGEN'      ,null   ,5)
    ,(7    ,1   ,'METEN'        ,4      ,null)
    ,(8    ,2   ,'OP PAPIER'    ,4      ,null)
    ,(9    ,1   ,'LINNEN'       ,5      ,null)
    ,(10   ,2   ,'NAAIEN'       ,5      ,null)
    ,(11   ,3   ,'NIETEN'       ,5      ,null)
    ,(12   ,1   ,'GEREEDSCHAP'  ,null   ,10)
    ,(13   ,2   ,'MATERIALEN'   ,null   ,10)
    ,(14   ,3   ,'BEZIG'        ,null   ,10)
    ,(15   ,1   ,'DE ZAAG'      ,12     ,null)
    ,(16   ,2   ,'DE HAMER'     ,12     ,null)
    ,(17   ,1   ,'KLEDING'      ,14     ,null)
    ,(18   ,2   ,'VERBAND'      ,14     ,null)
