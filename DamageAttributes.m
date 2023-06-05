classdef DamageAttributes
    %DAMAGEATTRIBUTES �˴���ʾ�йش����ժҪ
    %   �˴���ʾ��ϸ˵��
    
    properties
        basicATK = 1016; %������ֵ
        attackAmp = 0; %��������
        addATK = 2337; %�����ֵ
        amplitude = 0.27+0.63; %���ܱ���
        damageAmp = 0.1; %����
        criChance = 0.78; %������
        criDamage = 1.072; %�����˺�
        toughness = 0.1; %����
        damageResist = 0.2; %���Կ���
        vulnerable = 0; %����
        penetrate = 0; %��͸
        debuffResist = 0; %debuff�ֿ�
        defenceAmp = 0.1; %����
        pLevel = 70; %�ҷ��ȼ�
        eLevel = 63; %�з��ȼ�
    end
    
    methods
        function obj = DamageAttributes()
            %obj = setValue(obj, 'basicATK', 1000);
        end
        
        function obj = setValue(obj, name, value)
            switch name
                case 'basicATK'
                    obj.basicATK = value;
                case 'attackAmp'
                    obj.attackAmp = value;
                case 'addATK'
                    obj.addATK = value;
                case 'amplitude'
                    obj.amplitude = value;
                case 'criChance'
                    obj.criChance = value;
                case 'criDamage'
                    obj.criDamage = value;
                case 'toughness'
                    obj.toughness = value;
                case 'damageResist'
                    obj.damageResist = value;
                case 'vulnerable'
                    obj.vulnerable = value;
                case 'penetrate'
                    obj.penetrate = value;
                case 'debuggResist'
                    obj.debuffResist = value;
                case 'defenceAmp'
                    obj.defenceAmp = value;
                case 'pLevel'
                    obj.pLevel = value;
                case 'eLevel'
                    obj.eLevel = value;
            end
        end
    end
    
    methods(Static)
        function damageE = damageEstimation(obj)
            damageE = (obj.basicATK*(1+obj.attackAmp)+obj.addATK)...
                *obj.amplitude*(1+obj.damageAmp)...
                *(1+obj.criChance*obj.criDamage)...
                *(1-obj.toughness)*((1+obj.vulnerable)...
                *(1-obj.damageResist+obj.penetrate))...
                *(1+(1-(1-obj.debuffResist)*obj.defenceAmp)...
                    *((obj.eLevel*10+200)./(obj.pLevel*10+200))).^-1;
        end
    end
    
end

