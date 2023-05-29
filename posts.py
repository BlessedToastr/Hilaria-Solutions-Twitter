import csv
import os
import shutil

post_on = '2023-05-29 02:18:46'

sql_posts_file = open('posts.sql', 'a')
sql_posts_file.write('INSERT INTO `posts` (`id`, `user_id`, `post_on`) VALUES\n')

sql_tweets_file = open('tweets.sql', 'a')
sql_tweets_file.write('INSERT INTO `tweets` (`post_id`, `status`, `img`) VALUES\n')

pid=1
path='./posts/'

for root,directories,files in os.walk(path):
    for file in files:
        print('Post ID: ' + str(pid))

        # get path of post
        print('Path: ' + os.path.join(root,file))
        
        # get username based on path
        username = root.split('/')[2]
        print('Username: ' + username)

        # get uid from username
        uid=0
        with open('Twitter_Users.csv', 'r') as csvfile:
            reader = csv.reader(csvfile)

            for row in reader:
                if row[1] == username:
                    uid = row[0]

        print('User ID: ' + uid)

        # Get status from name of file
        file_name, file_ext = os.path.splitext(file)
        print('Status: ' + file_name)

        # Get name of new name of img
        new_image_name = str(pid)+'.jpg'
        print('IMG: ' + new_image_name)

        # Rename image
        # os.rename(os.path.join(root,file),new_image_name)

        # Move image to /var/www/html/assets/images/tweets
        shutil.copy(os.path.join(root,file),'/var/www/html/assets/images/tweets/'+new_image_name)
        print('Copied!')

        # Write to sql files
        # write to post file
        sql_posts_file.write(f'({pid}, {uid}, \'{post_on}\'),\n')
        print('Written to posts sql')

        # write to tweets file
        sql_tweets_file.write(f'({pid}, \'{file_name}\', \'{new_image_name}\'),\n')
        print('Writtent to tweets sql')

        pid += 1
        print('\n===\n')

sql_posts_file.close()
sql_tweets_file.close()
