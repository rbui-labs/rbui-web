import { application } from "../../../app/javascript/controllers/application";

// Import all controller files
import PopoverController from "./popover/popover_controller";


// Register all controllers
application.register("rbui--popover", PopoverController);


import RBUI from "rbui-js";
RBUI.initialize(application);
