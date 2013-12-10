package dao;

public abstract class DAOFactory {

    public abstract AlbumDao getAlbumDAO();

    public abstract CompetitionDao getCompetitionDAO();

    public abstract DojoDao getDojoDAO();

    public abstract EntraineurDao getEntraineurDAO();

    public abstract EvenementDao getEvenementDAO();

    public abstract HistoireDao getHistoireDAO();

    public abstract HoraireDao getHoraireDAO();

    public abstract InformationDao getInformationDAO();

    public abstract LicencieDao getLicencieDAO();

    public abstract MembreDao getMembreDAO();

    public abstract PersonneDao getPersonneDAO();

    public abstract ResultatDao getResultatDAO();

    public static DAOFactory getDAOFactory(int whichFactory) {
        return new HibernateDAOFactory();
    }

}
