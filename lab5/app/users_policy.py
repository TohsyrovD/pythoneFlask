from flask_login import current_user
# по таблице ролей 
ADMIN_ROLE_ID = 1

#  является ли пользователь админом 
def is_admin():
    return current_user.role_id == ADMIN_ROLE_ID

#разграничения действий пользлватля, допуск к определенной функциональности 
class UsersPolicy:

    def __init__(self, record=None):
        self.record = record
#редактирование ( проверяем являетяс ли текущий пользовател тем, кого пытаются отредактировать)
    def edit(self):
        is_editing_user = current_user.id == self.record.id
        return is_admin() or is_editing_user
# права на просмор ( либо может смотреть подробную инфу о себе, либо если админ, то любую запись)
    def show(self):
        is_showing_user = current_user.id == self.record.id
        return is_admin() or is_showing_user
# создает запись только админ    
    def new(self):
        return is_admin()
# удаляет только админ, возвращает тру или фолз 
    def delete(self):
        return is_admin()