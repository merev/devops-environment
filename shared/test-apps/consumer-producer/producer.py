from kafka import KafkaProducer
from time import sleep
from random import randrange

tpk = ['demo']
idx = 1
print('Producer started. Press Ctrl+C to stop. Working on topic=' + str(tpk))

try:
    producer = KafkaProducer(bootstrap_servers=['localhost:9092'])
    while True:
        st = 'My number is ' + str(idx)
        print('message: ' + st)
        for t in tpk:
            producer.send(t, bytes(st, encoding='utf-8'))
        producer.flush()
        slp = randrange(1,10)
        print('Sleep for ' + str(slp) + ' second(s).')
        sleep(slp)
        idx = idx + 1
except Exception as ex:
    print(str(ex))
except KeyboardInterrupt:
    pass
finally:
    if producer is not None:
        producer.close()

print('... closed.')
