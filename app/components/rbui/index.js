import { application } from "../../../app/javascript/controllers/application";

// Import all controller files
import CalendarController from "./calendar/calendar_controller";
import CalendarInputController from "./calendar/calendar_input_controller";

// Register all controllers
application.register("rbui--calendar", CalendarController);
application.register("rbui--calendar-input", CalendarInputController);

import RBUI from "rbui-js";
RBUI.initialize(application);
