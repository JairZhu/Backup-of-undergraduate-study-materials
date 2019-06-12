import pyodbc

cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};Server=172.18.35.96;PORT=1433;DATABASE=QQ_Speed;UID=sa;PWD=zhuzhiru')
cursor = cnxn.cursor()

def verifyLogin(username, password):
    cursor.execute("""
        select password
        from player
        where name = ?
    """, username)
    row = cursor.fetchone()
    if row == None:
        return False
    return password == row.password

def addplayer(username, password):
    cursor.execute("""
            select password
            from player
            where name = ?
        """, username)
    row = cursor.fetchone()
    if row is not None:
        return False
    cursor.execute("""
        insert into player
        values (?, ?, 0, 0, 0, '青铜', 5, 0, 100000)
    """, username, password)
    cnxn.commit()
    return True

def getCar(name = None):
    cars = []
    if name == None:
        cursor.execute("""
            select *
            from car
        """)
        rows = cursor.fetchall()
        for row in rows:
            cars.append({
                'name': row.car_name,
                'level': row.car_level,
                'charming': row.car_charmingvalue,
                'description': row.car_description,
                'price': row.car_price
            })
    else:
        cursor.execute("""
            select *
            from car
            where car_name like '%{name}%'
        """.format(name=name))
        rows = cursor.fetchall()
        for row in rows:
            cars.append({
                'name': row.car_name,
                'level': row.car_level,
                'charming': row.car_charmingvalue,
                'description': row.car_description,
                'price': row.car_price
            })
    return cars

def getPet(name = None):
    pets = []
    if name == None:
        cursor.execute("""
            select *
            from pet
        """)
        rows = cursor.fetchall()
        for row in rows:
            pets.append({
                'name': row.pet_name,
                'charming': row.pet_charmingvalue,
                'description': row.pet_description,
                'price': row.pet_price
            })
    else:
        cursor.execute("""
            select *
            from pet
            where pet_name like '%{name}%'
        """.format(name=name))
        rows = cursor.fetchall()
        for row in rows:
            pets.append({
                'name': row.pet_name,
                'charming': row.pet_charmingvalue,
                'description': row.pet_description,
                'price': row.pet_price
            })
    return pets

def getCloth(name = None):
    clothes = []
    if name == None:
        cursor.execute("""
            select *
            from clothes
        """)
        rows = cursor.fetchall()
        for row in rows:
            clothes.append({
                'name': row.clothes_name,
                'charming': row.clothes_charmingvalue,
                'price': row.clothes_price
            })
    else:
        cursor.execute("""
            select *
            from clothes
            where clothes_name like '%{name}%'
        """.format(name=name))
        rows = cursor.fetchall()
        for row in rows:
            clothes.append({
                'name': row.clothes_name,
                'charming': row.clothes_charmingvalue,
                'price': row.clothes_price
            })
    return clothes


def getMap(name = None):
    maps = []
    if name == None:
        cursor.execute("""
            select *
            from map
        """)
        rows = cursor.fetchall()
        for row in rows:
            maps.append({
                'name': row.map_name,
                'star_level': row.star_level,
                'map_description': row.map_description,
                'best_record': row.best_record
            })
    else:
        cursor.execute("""
            select *
            from map
            where map_name like '%{name}%'
        """.format(name=name))
        rows = cursor.fetchall()
        for row in rows:
            maps.append({
                'name': row.map_name,
                'star_level': row.star_level,
                'map_description': row.map_description,
                'best_record': row.best_record
            })
    return maps

def getUserInfo(name):
    cursor.execute("""
        select *
        from player
        where name = ?
    """, name)
    row = cursor.fetchone()
    userinfo = {
        'name': name,
        'current_experience': row.current_experience,
        'experience_to_upgrade': row.current_level * 1000 - row.current_experience,
        'current_level': row.current_level,
        'current_charming_level': row.current_charming_level,
        'player_level_1': row.player_level1,
        'player_level_2': row.player_level2,
        'player_level_3': row.player_level3,
        'money': row.money
    }
    cursor.execute("""
        select *
        from fleet_of_player
        where player_name = ?
    """, name)
    fleet_name = cursor.fetchone()
    if fleet_name != None:
        userinfo['team'] = fleet_name.fleet_name
    return userinfo

def getTeam(name):
    cursor.execute("""
        select fleet_name
        from fleet_of_player
        where player_name = ?
    """, name)
    row = cursor.fetchone()
    cursor.execute("""
        select *
        from fleet
        where fleet_name = ?
    """, row.fleet_name)
    row = cursor.fetchone()
    properties = {
        'fleet_name': row.fleet_name,
        'captain': row.captain,
        'fleet_level1': row.fleet_level1,
        'fleet_level2': row.fleet_level2,
        'fleet_level3': row.fleet_level3
    }
    cursor.execute("""
        select player_name
        from fleet_of_player
        where fleet_name = ?
    """, row.fleet_name)
    rows = cursor.fetchall()
    members = []
    for it in rows:
        members.append(getUserInfo(it.player_name))
    for i in range(len(members)):
        if members[i]['name'] == properties['captain'] and i != 0:
            members[i], members[0] = members[0], members[i]
            break
    return {'properties': properties, 'members': members}


def getItem(name, type):
    current = None
    item_list = []
    if type == 'user-car':
        cursor.execute("""
            select *
            from cars_of_player, car
            where player_name = ? and car.car_name = cars_of_player.car_name
        """, name)
        rows = cursor.fetchall()
        for row in rows:
            if row.is_driving == 1:
                current = {
                    'name': row.car_name,
                    'level': row.car_level,
                    'charming': row.car_charmingvalue,
                    'description': row.car_description,
                    'price': row.car_price
                }
            else:
                item_list.append({
                    'name': row.car_name,
                    'level': row.car_level,
                    'charming': row.car_charmingvalue,
                    'description': row.car_description,
                    'price': row.car_price
                })
    elif type == 'user-pet':
        cursor.execute("""
            select *
            from pet, pets_of_player
            where player_name = ? and pet.pet_name = pets_of_player.pet_name
        """, name)
        rows = cursor.fetchall()
        for row in rows:
            if row.is_taking == 1:
                current = {
                    'name': row.pet_name,
                    'charming': row.pet_charmingvalue,
                    'description': row.pet_description,
                    'price': row.pet_price,
                    'level': row.pet_level,
                    'experience': row.pet_experience
                }
            else:
                item_list.append({
                    'name': row.pet_name,
                    'charming': row.pet_charmingvalue,
                    'description': row.pet_description,
                    'price': row.pet_price,
                    'level': row.pet_level,
                    'experience': row.pet_experience
                })
    elif type == 'user-cloth':
        cursor.execute("""
            select *
            from clothes, clothes_of_player
            where player_name = ? and clothes.clothes_name = clothes_of_player.clothes_name
        """, name)
        rows = cursor.fetchall()
        for row in rows:
            if row.iswearing == 1:
                current = {
                    'name': row.clothes_name,
                    'charming': row.clothes_charmingvalue,
                    'price': row.clothes_price
                }
            else:
                item_list.append({
                    'name': row.clothes_name,
                    'charming': row.clothes_charmingvalue,
                    'price': row.clothes_price
                })
    if current == None and len(item_list) == 0:
        return {}
    elif current == None:
        return {'item-list': item_list}
    return {'current': current, 'item-list': item_list}


def removePlayer(fleet_name, player_name):
    cursor.execute("""
        select player_name
        from fleet_of_player
        where fleet_name = ?
    """, fleet_name)
    rows = cursor.fetchall()
    notin = True
    for row in rows:
        if row.player_name == player_name:
            notin = False
    if notin:
        return False
    cursor.execute("""
        delete from fleet_of_player
        where fleet_name = ? and player_name = ?
    """, fleet_name, player_name)
    cnxn.commit()
    return True

# 车队添加新成员，参数如removePlayer函数
def FleetaddPlayer(fleet_name, player_name):
    cursor.execute("""
        select player_name
        from fleet_of_player
        where fleet_name = ?
    """, fleet_name)
    rows = cursor.fetchall()
    if rows == None:
        return False
    isin = False
    for row in rows:
        if row.player_name == player_name:
            isin = True
    if isin:
        return False
    cursor.execute("""
        insert into fleet_of_player
        values (?, ?, 0)
    """, player_name, fleet_name)
    cnxn.commit()
    return True

def buy(type, name, user):
    cursor.execute("""
        select money
        from player
        where name = ?
    """, user)
    user_money = cursor.fetchone().money
    if type == 'car':
        cursor.execute("""
            select car_price
            from car
            where car_name = ?
        """, name)
        car_price = cursor.fetchone().car_price
        if user_money < car_price:
            return False
        cursor.execute("""
            insert into cars_of_player
            values (?, ?, 0)
        """, user, name)
    elif type == 'cloth':
        cursor.execute("""
            select clothes_price
            from clothes
            where clothes_name = ?
        """, name)
        clothes_price = cursor.fetchone().clothes_price
        if user_money < clothes_price:
            return False
        cursor.execute("""
            insert into clothes_of_player
            values (?, ?, 0)
        """, user, name)
    elif type == 'pet':
        cursor.execute("""
            select pet_price
            from pet
            where pet_name = ?
        """, name)
        pet_price = cursor.fetchone().pet_price
        if user_money < pet_price:
            return False
        cursor.execute("""
            insert into pets_of_player
            values (?, ?, 0, 0, 0)
        """, user, name)
    cnxn.commit()
    return True

def dress(type, name, user):
    if type == 'user-car':
        is_driving = 1
        if name == None:
            is_driving = 0
            cursor.execute("""
                select car_name
                from cars_of_player
                where player_name = ? and is_driving = 1
            """, user)
            name = cursor.fetchone().car_name
        cursor.execute("""
            update cars_of_player
            set is_driving = ?
            where player_name = ? and car_name = ?
        """, is_driving, user, name)
    elif type == 'user-pet':
        is_taking = 1
        if name == None:
            is_taking = 0
            cursor.execute("""
                select pet_name
                from pets_of_player
                where player_name = ? and is_taking = 1
            """, user)
            name = cursor.fetchone().pet_name
        cursor.execute("""
            update pets_of_player
            set is_taking = ?
            where player_name = ? and pet_name = ?
        """, is_taking, user, name)
    elif type == 'user-cloth':
        iswearing = 1
        if name == None:
            iswearing = 0
            cursor.execute("""
                select clothes_name
                from clothes_of_player
                where player_name = ? and iswearing = 1
            """, user)
            name = cursor.fetchone().clothes_name
        cursor.execute("""
            update clothes_of_player
            set iswearing = ?
            where player_name = ? and clothes_name = ?
        """, iswearing, user, name)
    cnxn.commit()
    return True

def addRace(lane, user, score):
    score = int(score)
    cursor.execute("""
        select *
        from maps_of_player
        where map_name = ? and player_name = ?
    """, lane, user)
    row = cursor.fetchone()
    if row == None:
        cursor.execute("""
            insert into maps_of_player
            values (?, ?, ?)
        """, user, lane, score)
    elif score < row.record:
        cursor.execute("""
            update maps_of_player
            set record = ?
            where player_name = ? and map_name = ?
        """, score, user, lane)
    cursor.execute("""
        select *
        from map
        where map_name = ?
    """, lane)
    map_star_level = cursor.fetchone().star_level
    money = map_star_level * 500
    player_experience = map_star_level * 1000
    player_victory = map_star_level * 25
    fleet_contribution = map_star_level * 100
    fleet_victory = map_star_level * 10
    pet_experience = map_star_level * 100
    cursor.execute("""
        update player
        set money += ?, current_experience += ?, player_level3 += ?
        where name = ?
    """, money, player_experience, player_victory, user)
    cursor.execute("""
        select *
        from fleet_of_player
        where player_name = ?
    """, user)
    row = cursor.fetchone()
    if row != None:
        fleet_name = row.fleet_name
        cursor.execute("""
            update fleet_of_player
            set contribution += ?
            where player_name = ?
        """, fleet_contribution, user)
        cursor.execute("""
            update fleet
            set fleet_level3 += ?
            where fleet_name = ?
        """, fleet_victory, fleet_name)
    cursor.execute("""
        select *
        from pets_of_player
        where player_name = ? and is_taking = 1
    """, user)
    row = cursor.fetchone()
    if row != None:
        pet_name = row.pet_name
        cursor.execute("""
            update pets_of_player
            set pet_experience += ?
            where player_name = ? and pet_name = ?
        """, pet_experience, user, pet_name)
    cnxn.commit()
    return True