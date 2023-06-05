classdef DamageAttributes
    %DAMAGEATTRIBUTES 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        basicATK = 1016; %基础白值
        attackAmp = 0; %攻击增幅
        addATK = 2337; %额外白值
        amplitude = 0.27+0.63; %技能倍率
        damageAmp = 0.1; %增伤
        criChance = 0.78; %暴击率
        criDamage = 1.072; %暴击伤害
        toughness = 0.1; %韧性
        damageResist = 0.2; %属性抗性
        vulnerable = 0; %易伤
        penetrate = 0; %穿透
        debuffResist = 0; %debuff抵抗
        defenceAmp = 0.1; %减防
        pLevel = 70; %我方等级
        eLevel = 63; %敌方等级
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

