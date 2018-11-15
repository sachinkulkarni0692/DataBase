# -*- coding: utf-8 -*-
"""
Created on Thu Oct  4 13:22:48 2018

@author: sachi
"""
import pymysql

conn = pymysql.connect(host='localhost', port=3306, user='root', passwd='sachin', db='dbproject')

cur1 = conn.cursor()
cur2 = conn.cursor()
cur3 = conn.cursor()
cur4 = conn.cursor()
cur5 = conn.cursor()
cur6 = conn.cursor()

data_placeholder = ""
call_placeholder = ""
message_placeholder = ""
port_placeholder = ""
new_adds_placeholder = ""

cur1.execute("select * FROM subscriber")
cur2.execute("select count(message_sent) from Subscriber_message_records")
for rows in cur2: message_placeholder = rows[0]
cur2.execute("select sum(data_sent) from Subscriber_data_records")
for rows in cur2: data_placeholder = rows[0]
cur2.execute("select sum(call_duration) from Subscriber_call_records")
for rows in cur2: call_placeholder = rows[0]
cur2.execute("select count(*) from port where port_type = 'port_out'")
for rows in cur2: port_placeholder = rows[0]
cur2.execute("select sum(src.cnt) from (select count(*) as cnt from subscriber union select count(*) as cnt from port where port_type = 'port_in')src")
for rows in cur2: new_adds_placeholder = rows[0]
cur4.execute("select * from Subscriber_message_records")
cur5.execute("select * from Subscriber_call_records")
cur3.execute("select * from Subscriber_data_records")
cur6.execute("select * from Port")


print()
def generate_table(cur):
	columns = [item[0] for item in cur.description]
	head = "<thead>"
	head_end = "</thead>"
	row = "<tr>"
	row_end = "</tr>"
	body = "<tbody>"
	body_end = "</tbody>"

	header = []
	data = []
	header.append(head)
	header.append(row)

	for item in columns : 
		header.append(str("<th>"+item+"</th>"))
	header.append(row_end)
	header.append(head_end)
	i=0
	data.append(body)
	for rows in cur:
		#print(len(row))
		data.append(row)
		for j in range(len(rows)):
			data.append("<td>"+str(rows[j])+"</td>")
		data.append(row_end)
	data.append(body_end)
	place_holder = ""
	for item in header : place_holder+=item
	for item in data : place_holder+=item
	return place_holder



file = open("C://Users//sachi//Desktop//bootstrap//startbootstrap-sb-admin-gh-pages//index.html",'r')
file_data = file.read().replace("table1",generate_table(cur1)).replace("data_sent",str(data_placeholder)[0:5]).replace("call_sent",str(call_placeholder)).replace("msg_sent",str(message_placeholder)).replace("port_out",str(port_placeholder)).replace("new_adds",str(new_adds_placeholder)).replace("table2",generate_table(cur4)).replace("table3",generate_table(cur5)).replace("table4",generate_table(cur3)).replace("table5",generate_table(cur6))
file.close()

file2 = open("C://Users//sachi//Desktop//bootstrap//startbootstrap-sb-admin-gh-pages//index1.html",'w+')
file2.write(file_data)
file2.close()

cur1.close()
cur2.close()
cur3.close()
cur4.close()
cur5.close()
cur6.close()
conn.close()