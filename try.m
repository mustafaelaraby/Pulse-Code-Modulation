% Generate sample data
x = linspace(0, 10, 100);
y = sin(x);

% Plot the data
plot(x, y);

% Get handle to current axes
ax = gca;

% Change the font family
ax.FontName = 'Times New Roman'; % Change 'Times New Roman' to your desired font

% Alternatively, you can change the font for specific text elements
% For example, change the font of the title
title('Sin Wave');
title_handle = get(gca, 'Title');
set(title_handle, 'FontName', 'Arial'); % Change 'Arial' to your desired font

% Change the font of the x and y axis labels
xlabel('Time (s)');
ylabel('Amplitude');
xlabel_handle = get(gca, 'XLabel');
ylabel_handle = get(gca, 'YLabel');
set(xlabel_handle, 'FontName', 'Helvetica'); % Change 'Helvetica' to your desired font
set(ylabel_handle, 'FontName', 'Helvetica'); % Change 'Helvetica' to your desired font
