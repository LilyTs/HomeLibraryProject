unit SQLStrings;

interface

const
  sqlGetPubHouses = 'SELECT * FROM PublishingHouse';
  sqlInsertPubHouse = 'INSERT INTO PublishingHouse VALUES(:PubHouse_id, :PubHouse_name)';
  sqlDeletePubHouse = 'DELETE FROM PublishingHouse WHERE PubHouse_id = :PubHouse_id';
  sqlEditPubHouse = 'UPDATE PublishingHouse SET Name = :Name WHERE PubHouse_id = :PubHouse_id';

  sqlGetFriends = 'SELECT * FROM Friend';
  sqlInsertFriend = 'INSERT INTO Friend VALUES(null, :FIO, :PhoneNumber, :SocialNumber, :Email, :Comment)';

implementation

end.
