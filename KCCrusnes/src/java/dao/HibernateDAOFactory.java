package dao;

// </editor-fold>
public class HibernateDAOFactory extends DAOFactory {

    @Override
    public AlbumDao getAlbumDAO() {
        AlbumDao albumDao = AlbumDaoImpl.getInstance();
        return albumDao;
    }

    @Override
    public CompetitionDao getCompetitionDAO() {
        CompetitionDao competitionDao = CompetitionDaoImpl.getInstance();
        return competitionDao;
    }

    @Override
    public DojoDao getDojoDAO() {
        DojoDao dojoDao = DojoDaoImpl.getInstance();
        return dojoDao;
    }

    @Override
    public EntraineurDao getEntraineurDAO() {
        EntraineurDao entraineurDao = EntraineurDaoImpl.getInstance();
        return entraineurDao;
    }

    @Override
    public EvenementDao getEvenementDAO() {
        EvenementDao evenementDao = EvenementDaoImpl.getInstance();
        return evenementDao;
    }

    @Override
    public HistoireDao getHistoireDAO() {
        HistoireDao histoireDao = HistoireDaoImpl.getInstance();
        return histoireDao;
    }

    @Override
    public HoraireDao getHoraireDAO() {
        HoraireDao horaireDao = HoraireDaoImpl.getInstance();
        return horaireDao;
    }

    @Override
    public InformationDao getInformationDAO() {
        InformationDao informationDao = InformationDaoImpl.getInstance();
        return informationDao;
    }

    @Override
    public LicencieDao getLicencieDAO() {
        LicencieDao licencieDao = LicencieDaoImpl.getInstance();
        return licencieDao;
    }

    @Override
    public MembreDao getMembreDAO() {
        MembreDao membreDao = MembreDaoImpl.getInstance();
        return membreDao;
    }

    @Override
    public PersonneDao getPersonneDAO() {
        PersonneDao personneDao = PersonneDaoImpl.getInstance();
        return personneDao;
    }

    @Override
    public ResultatDao getResultatDAO() {
        ResultatDao resultatDao = ResultatDaoImpl.getInstance();
        return resultatDao;
    }

}
