fig = uifigure('Name', 'ÐÇñ·ÌúµÀ');
ax = uiaxes('Parent', fig,...
    'Units', 'pixels',...
    'Position', [104, 123, 300, 201]);
btn = uibutton(fig, 'push',...
    'Position', [420, 218, 100, 22],...
    'ButtonPushedFcn', @(btn, event) plotButtonPushed(btn, ax));
bTx = text(fig,...
    'Position');

damageR = 1306; %391=914
attributes = DamageAttributes();
attributes = setValue(attributes, 'criChance', 0);
value = DamageAttributes.damageEstimation(attributes);

function plotButtonPushed(btn, ax)
    attributes = DamageAttributes();
    y = DamageAttributes.damageEstimation(attributes);
    x = 0:0.1:1;
    attributes1 = DamageAttributes();
    attributes1 = setValue(attributes1, 'criChance', 0.8);
    attributes1 = setValue(attributes1, 'defenceAmp', x);
    y1 = DamageAttributes.damageEstimation(attributes1)/y;
    attributes2 = DamageAttributes();
    attributes2 = setValue(attributes2, 'criChance', 0.8);
    attributes2 = setValue(attributes2, 'attackAmp', x);
    y2 = DamageAttributes.damageEstimation(attributes2)/y;
    attributes3 = DamageAttributes();
    attributes3 = setValue(attributes3, 'criChance', 0.8);
    attributes3 = setValue(attributes3, 'criDamage', 1+x);
    y3 = DamageAttributes.damageEstimation(attributes3)/y;
    plot(ax, x, y1, 'r-o', x, y2, 'b-o', x, y3, 'g-o');
    for i = 1:size(x,2)
        h1 = text(ax, x(i), y1(i), ['(', num2str(x(i)), ', ', num2str(y1(i)), ')'],...
            'Color', 'red');
        h2 = text(ax, x(i), y2(i), ['(', num2str(x(i)), ', ', num2str(y2(i)), ')'],...]
            'Color', 'blue');
        h3 = text(ax, x(i), y3(i), ['(', num2str(x(i)), ', ', num2str(y3(i)), ')'],...]
            'Color', 'green');
    end
    ext1 = get(h1,'Extent');
    ext2 = get(h2,'Extent');
    ext3 = get(h3,'Extent');
    rightPosition = max([ext1(1)+ext1(3), ext2(1)+ext2(3), ext3(1)+ext3(3)]);
    upperPosition = max([ext1(2)+ext1(4), ext2(2)+ext2(4), ext3(2)+ext3(4)]);
    xlim(ax,[min(xlim(ax)), max(rightPosition,max(xlim(ax)))]);
    ylim(ax,[min(ylim(ax)), max(upperPosition,max(ylim(ax)))]);
    
end
