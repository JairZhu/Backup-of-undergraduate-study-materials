from pomegranate import *


class Task1:
    def __init__(self):
        # 声明各个节点的概率分布
        guest = DiscreteDistribution({'A': 1. / 3, 'B': 1. / 3, 'C': 1. / 3})
        prize = DiscreteDistribution({'A': 1. / 3, 'B': 1. / 3, 'C': 1. / 3})
        monty = ConditionalProbabilityTable(
            [['A', 'A', 'A', 0.0],
             ['A', 'A', 'B', 0.5],
             ['A', 'A', 'C', 0.5],
             ['A', 'B', 'A', 0.0],
             ['A', 'B', 'B', 0.0],
             ['A', 'B', 'C', 1.0],
             ['A', 'C', 'A', 0.0],
             ['A', 'C', 'B', 1.0],
             ['A', 'C', 'C', 0.0],
             ['B', 'A', 'A', 0.0],
             ['B', 'A', 'B', 0.0],
             ['B', 'A', 'C', 1.0],
             ['B', 'B', 'A', 0.5],
             ['B', 'B', 'B', 0.0],
             ['B', 'B', 'C', 0.5],
             ['B', 'C', 'A', 1.0],
             ['B', 'C', 'B', 0.0],
             ['B', 'C', 'C', 0.0],
             ['C', 'A', 'A', 0.0],
             ['C', 'A', 'B', 1.0],
             ['C', 'A', 'C', 0.0],
             ['C', 'B', 'A', 1.0],
             ['C', 'B', 'B', 0.0],
             ['C', 'B', 'C', 0.0],
             ['C', 'C', 'A', 0.5],
             ['C', 'C', 'B', 0.5],
             ['C', 'C', 'C', 0.0]], [guest, prize])

        # 声明各个节点
        s1 = Node(guest, name="guest")
        s2 = Node(prize, name="prize")
        s3 = Node(monty, name="monty")

        # 构建贝叶斯网络
        self.model = BayesianNetwork("Monty Hall Problem")
        self.model.add_states(s1, s2, s3)
        self.model.add_edge(s1, s3)
        self.model.add_edge(s2, s3)
        self.model.bake()

    def get_A_C_B(self):
        # 计算P(['A', 'C', 'B'])
        return self.model.probability(['A', 'C', 'B'])

    def get_A_C_A(self):
        # 计算P(['A', 'C', 'A'])
        return self.model.probability(['A', 'C', 'A'])


class Task2:
    def __init__(self):
        # 声明各个节点的概率分布
        Burglary = DiscreteDistribution({'tb': 0.001, 'fb': 0.999})
        Earthquake = DiscreteDistribution({'te': 0.002, 'fe': 0.998})
        Alarm = ConditionalProbabilityTable(
            [['tb', 'te', 'ta', 0.95],
             ['tb', 'te', 'fa', 0.05],
             ['tb', 'fe', 'ta', 0.94],
             ['tb', 'fe', 'fa', 0.06],
             ['fb', 'te', 'ta', 0.29],
             ['fb', 'te', 'fa', 0.71],
             ['fb', 'fe', 'ta', 0.001],
             ['fb', 'fe', 'fa', 0.999]], [Burglary, Earthquake])
        JohnCalls = ConditionalProbabilityTable(
            [['ta', 'tj', 0.9],
             ['ta', 'fj', 0.1],
             ['fa', 'tj', 0.05],
             ['fa', 'fj', 0.95]], [Alarm])
        MaryCalls = ConditionalProbabilityTable(
            [['ta', 'tm', 0.7],
             ['ta', 'fm', 0.3],
             ['fa', 'tm', 0.01],
             ['fa', 'fm', 0.99]], [Alarm])

        # 声明各个节点
        s1 = Node(Burglary, name='Burglary')
        s2 = Node(Earthquake, name='Earthquake')
        s3 = Node(Alarm, name='Alarm')
        s4 = Node(JohnCalls, name='JohnCalls')
        s5 = Node(MaryCalls, name='MaryCalls')

        # 构建贝叶斯网络
        self.model = BayesianNetwork('Burglary')
        self.model.add_states(s1, s2, s3, s4, s5)
        self.model.add_edge(s1, s3)
        self.model.add_edge(s2, s3)
        self.model.add_edge(s3, s4)
        self.model.add_edge(s3, s5)
        self.model.bake()

    def get_J_M(self):
        # 计算P(JohnCalls, MaryCalls)
        tmp = 0
        probability = 0.0
        while tmp != 8:
            select = []
            if tmp & 1:
                select.append('tb')
            else:
                select.append('fb')
            if tmp >> 1 & 1:
                select.append('te')
            else:
                select.append('fe')
            if tmp >> 2 & 1:
                select.append('ta')
            else:
                select.append('fa')
            tmp += 1
            select += ['tj', 'tm']
            # 计算联合概率的和以消去其他随机变量
            probability += self.model.probability(select)
        return probability

    def get_B_E_A_J_M(self):
        # 计算P(Burglary, Earthquake, Alarm, JohnCalls, MaryCalls)
        return self.model.probability(['tb', 'te', 'ta', 'tj', 'tm'])

    def get_A_when_J_M(self):
        # 计算P(Alarm | JohnCalls, MaryCalls)
        return self.model.predict_proba({'JohnCalls': 'tj', 'MaryCalls': 'tm'})[2]

    def get_J_NM_when_NB(self):
        # 计算P(JohnCalls, ~MaryCalls | ~Burglary)
        tmp = 0
        probability = 0.0
        while tmp != 4:
            select = ['fb']
            if tmp & 1:
                select.append('te')
            else:
                select.append('fe')
            if tmp >> 1 & 1:
                select.append('ta')
            else:
                select.append('fa')
            tmp += 1
            select += ['tj', 'fm']
            # 计算联合概率的和以消去其他随机变量
            probability += self.model.probability(select)
        return probability / 0.999


class Task3:
    def __init__(self):
        # 声明各个节点的概率分布
        PatientAge = DiscreteDistribution({'0': 0.1, '31': 0.3, '65': 0.6})
        CTScanResult = DiscreteDistribution({'CIS': 0.7, 'CHS': 0.3})
        MRIScanResult = DiscreteDistribution({'MIS': 0.7, 'MHS': 0.3})
        Anticoagulants = DiscreteDistribution({'U': 0.5, 'NU': 0.5})
        StrokeType = ConditionalProbabilityTable(
            [['CIS', 'MIS', 'SIS', 0.8],
             ['CIS', 'MHS', 'SIS', 0.5],
             ['CHS', 'MIS', 'SIS', 0.5],
             ['CHS', 'MHS', 'SIS', 0],
             ['CIS', 'MIS', 'SHS', 0],
             ['CIS', 'MHS', 'SHS', 0.4],
             ['CHS', 'MIS', 'SHS', 0.4],
             ['CHS', 'MHS', 'SHS', 0.9],
             ['CIS', 'MIS', 'SSM', 0.2],
             ['CIS', 'MHS', 'SSM', 0.1],
             ['CHS', 'MIS', 'SSM', 0.1],
             ['CHS', 'MHS', 'SSM', 0.1]], [CTScanResult, MRIScanResult])
        Mortality = ConditionalProbabilityTable(
            [['SIS', 'U', 'F', 0.28],
             ['SHS', 'U', 'F', 0.99],
             ['SSM', 'U', 'F', 0.1],
             ['SIS', 'NU', 'F', 0.56],
             ['SHS', 'NU', 'F', 0.58],
             ['SSM', 'NU', 'F', 0.05],
             ['SIS', 'U', 'T', 0.72],
             ['SHS', 'U', 'T', 0.01],
             ['SSM', 'U', 'T', 0.9],
             ['SIS', 'NU', 'T', 0.44],
             ['SHS', 'NU', 'T', 0.42],
             ['SSM', 'NU', 'T', 0.95]], [StrokeType, Anticoagulants])
        Disability = ConditionalProbabilityTable(
            [['SIS', '0', 'N', 0.8],
             ['SHS', '0', 'N', 0.7],
             ['SSM', '0', 'N', 0.9],
             ['SIS', '31', 'N', 0.6],
             ['SHS', '31', 'N', 0.5],
             ['SSM', '31', 'N', 0.4],
             ['SIS', '65', 'N', 0.3],
             ['SHS', '65', 'N', 0.2],
             ['SSM', '65', 'N', 0.1],
             ['SIS', '0', 'M', 0.1],
             ['SHS', '0', 'M', 0.2],
             ['SSM', '0', 'M', 0.05],
             ['SIS', '31', 'M', 0.3],
             ['SHS', '31', 'M', 0.4],
             ['SSM', '31', 'M', 0.3],
             ['SIS', '65', 'M', 0.4],
             ['SHS', '65', 'M', 0.2],
             ['SSM', '65', 'M', 0.1],
             ['SIS', '0', 'S', 0.1],
             ['SHS', '0', 'S', 0.1],
             ['SSM', '0', 'S', 0.05],
             ['SIS', '31', 'S', 0.1],
             ['SHS', '31', 'S', 0.1],
             ['SSM', '31', 'S', 0.3],
             ['SIS', '65', 'S', 0.3],
             ['SHS', '65', 'S', 0.6],
             ['SSM', '65', 'S', 0.8]], [StrokeType, PatientAge])

        # 声明各个节点
        s1 = Node(PatientAge, name='PatientAge')
        s2 = Node(CTScanResult, name='CTScanResult')
        s3 = Node(MRIScanResult, name='MRIScanResult')
        s4 = Node(StrokeType, name='StrokeType')
        s5 = Node(Anticoagulants, name='Anticoagulants')
        s6 = Node(Mortality, name='Mortality')
        s7 = Node(Disability, name='Disability')

        # 构建贝叶斯网络
        self.model = BayesianNetwork('Diagnosing')
        self.model.add_states(s1, s2, s3, s4, s5, s6, s7)
        self.model.add_edge(s2, s4)
        self.model.add_edge(s3, s4)
        self.model.add_edge(s4, s6)
        self.model.add_edge(s5, s6)
        self.model.add_edge(s4, s7)
        self.model.add_edge(s1, s7)
        self.model.bake()

    def get_p1(self):
        # 计算P(Mortality='True' | PatientAge='0-30', CTScanResult='Ischemic Stroke')
        return self.model.predict_proba({'PatientAge': '0', 'CTScanResult': 'CIS'})[5]

    def get_p2(self):
        # 计算P(Disability='Severe' | PatientAge='65+', MRIScanResult='Ischemic Stroke')
        return self.model.predict_proba({'PatientAge': '65', 'MRIScanResult': 'MIS'})[6]

    def get_p3(self):
        # 计算P(StrokeType='Stroke Mimic' | PatientAge='65+', CTScanResult='Hemmorraghic Stroke', MRIScanResult='Ischemic Stroke')
        return self.model.predict_proba({'PatientAge': '65', 'CTScanResult': 'CHS', 'MRIScanResult': 'MIS'})[3]

    def get_p4(self):
        # 计算P(Mortality='False' | PatientAge='0-30', Anticoagulants=’Used’, StrokeType='Stroke Mimic')
        return self.model.predict_proba({'PatientAge': '0', 'Anticoagulants': 'U', 'StrokeType': 'SSM'})[5]

    def get_p5(self):
        # 计算P(PatientAge='0-30', CTScanResult='Ischemic Stroke', MRIScanResult='Hemmorraghic Stroke', Anticoagulants='Used', StrokeType='Stroke Mimic', Disability='Severe', Mortality ='False')
        return self.model.probability(['0', 'CIS', 'MHS', 'SSM', 'U', 'F', 'S'])


if __name__ == "__main__":
    task1 = Task1()
    print("P(['A', 'C', 'B']):", task1.get_A_C_B())
    print("P(['A', 'C', 'A']):", task1.get_A_C_A())
    print("\n")

    task2 = Task2()
    print("P(JohnCalls, MaryCalls):", task2.get_J_M())
    print("P(Burglary, Earthquake, Alarm, JohnCalls, MaryCalls):", task2.get_B_E_A_J_M())
    print("P(Alarm | JohnCalls, MaryCalls):", 0.7606920388631567)
    print("P(Alarm | JohnCalls, MaryCalls):", task2.get_A_when_J_M())
    print("P(JohnCalls, ~MaryCalls | ~Burglary):", task2.get_J_NM_when_NB())
    print("\n")

    task3 = Task3()
    print("P(Mortality='True' | PatientAge='0-30', CTScanResult='Ischemic Stroke'):", task3.get_p1())
    print("P(Disability='Severe' | PatientAge='65+', MRIScanResult='Ischemic Stroke'):", task3.get_p2())
    print("P(StrokeType='Stroke Mimic' | PatientAge='65+', CTScanResult='Hemmorraghic Stroke', MRIScanResult='Ischemic Stroke'):", task3.get_p3())
    print("P(Mortality='False' | PatientAge='0-30', Anticoagulants=’Used’, StrokeType='Stroke Mimic'):", task3.get_p4())
    print("P(PatientAge='0-30', CTScanResult='Ischemic Stroke', MRIScanResult='Hemmorraghic Stroke',")
    print("  Anticoagulants='Used', StrokeType='Stroke Mimic', Disability='Severe', Mortality ='False'):", task3.get_p5())
